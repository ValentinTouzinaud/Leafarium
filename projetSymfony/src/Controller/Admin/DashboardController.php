<?php

namespace App\Controller\Admin;

use App\Entity\Plante;
use App\Entity\Client;
use App\Entity\Reservation;
use EasyCorp\Bundle\EasyAdminBundle\Router\AdminUrlGenerator;
use EasyCorp\Bundle\EasyAdminBundle\Config\Dashboard;
use EasyCorp\Bundle\EasyAdminBundle\Config\MenuItem;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractDashboardController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class DashboardController extends AbstractDashboardController
{
    #[Route('/admin', name: 'admin')]
    public function index(): Response
    {
        $adminUrlGenerator = $this->container->get(AdminUrlGenerator::class);
            return $this->redirect($adminUrlGenerator->setController(PlanteCrudController::class)->generateUrl());
        // return parent::index();

        // Option 1. You can make your dashboard redirect to some common page of your backend
        //
        // $adminUrlGenerator = $this->container->get(AdminUrlGenerator::class);
        // return $this->redirect($adminUrlGenerator->setController(OneOfYourCrudController::class)->generateUrl());

        // Option 2. You can make your dashboard redirect to different pages depending on the user
        //
        // if ('jane' === $this->getUser()->getUsername()) {
        //     return $this->redirect('...');
        // }

        // Option 3. You can render some custom template to display a proper dashboard with widgets, etc.
        // (tip: it's easier if your template extends from @EasyAdmin/page/content.html.twig)
        //
        // return $this->render('some/path/my-dashboard.html.twig');
    }

    public function configureDashboard(): Dashboard    // petit logo Leafarium + titre
    {
        return Dashboard::new()
            ->setFaviconPath('img/logo.png')
            ->setTitle('<img src="img/logo.png" alt="titre" style="width: 10%; margin-bottom: 3%;"> Leafarium');
    }



    public function configureMenuItems(): iterable   // On affiche les menues que l'on veut
    {
        yield MenuItem::linkToUrl('Accueil', 'fa fa-home', 'http://127.0.0.1:3000/?#/');
        yield MenuItem::linkToCrud('Plante', 'fas fa-list', Plante::class);
        yield MenuItem::linkToCrud('Client', 'fas fa-user', Client::class);
        yield MenuItem::linkToCrud('Reservation', 'fas fa-user', Reservation::class);
    }
}
