<?php

namespace App\Controller\Admin;

use EasyCorp\Bundle\EasyAdminBundle\Field\BooleanField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use Vich\UploaderBundle\Form\Type\VichImageType;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use App\Entity\Plante;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class PlanteCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Plante::class;
    }

    
    public function configureFields(string $pageName): iterable   // on prend tout de la classe Plante
    {
        return [
            IdField::new('id')->onlyOnIndex(),
            TextField::new('nomImage'),
            TextField::new('descImage'),
            BooleanField::new('visible'),
            TextField::new('imageFile')->setFormType(VichImageType::class)->onlyOnForms(),
            TextField::new('image2File')->setFormType(VichImageType::class)->onlyOnForms(),
            ImageField::new('image')->setBasePath('/img')->onlyOnIndex(),
            ImageField::new('image2')->setBasePath('/img')->onlyOnIndex(),
            TextField::new('nom'),
            TextareaField::new('description'),
            TextField::new('descFlo'),
            TextField::new('descSymb'),
            TextField::new('descTaille'),
        ];
    }
    
}
