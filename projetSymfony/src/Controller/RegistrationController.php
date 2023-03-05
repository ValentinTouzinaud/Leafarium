<?php

namespace App\Controller;

use App\Entity\Client;
use App\Form\RegistrationFormType;
use App\Security\LoginAuthenticator;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Authentication\UserAuthenticatorInterface;

class RegistrationController extends AbstractController
{
    #[Route('/api/register', name: 'app_register')]
    public function register(Request $request, UserPasswordHasherInterface $userPasswordHasher, EntityManagerInterface $entityManager): Response
    {
        $user = new Client();
        try{
            $user->setUsername($request->toArray()["username"]);
            $user->setPassword(
                $userPasswordHasher->hashPassword(
                    $user,
                    $request->toArray()["password"]
                )
            );
            $entityManager->persist($user);
            $entityManager->flush();
            return new Response();
        }catch(\Exception $e){
            throw new Exception("Une erreur est survenue !");
        }
    }
}
