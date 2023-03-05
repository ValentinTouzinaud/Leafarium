<?php

namespace App\Controller;

use App\Entity\Plante;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class DefaultController extends AbstractController {

    #[Route('/', name: 'home')]
    public function index(): Response {
        return $this->redirect('http://127.0.0.1:3000/?#/');
    }


    #[Route('/plante/{id}', name: 'detail')]
    public function detail(Plante $plante): Response {
        return $this->render('default/detail.html.twig', ['p' => $plante]);
    }

}
