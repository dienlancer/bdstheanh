<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class SitemapRender extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'sitemap:auto';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Auto create sitemap.xml';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        $sitemap = \App::make("sitemap");        
        $query=\DB::table('menu')
        ->join('menu_type','menu.menu_type_id', '=' ,'menu_type.id');
        $query->where('menu_type.theme_location','main-menu');  
        $query->select('menu.alias','menu.updated_at');
        $menus=$query->get();
        $articles = \DB::table('article')->orderBy('created_at', 'desc')->select('alias','updated_at')->get();
        $products = \DB::table('product')->orderBy('created_at', 'desc')->select('alias','updated_at')->get();
        $projects = \DB::table('project')->orderBy('created_at', 'desc')->select('alias','updated_at')->get();
        $organizations = \DB::table('organization')->orderBy('created_at', 'desc')->select('alias','updated_at')->get();
        $project_articles = \DB::table('project_article')->orderBy('created_at', 'desc')->select('alias','updated_at')->get();
        if(count($menus) > 0){
            foreach ($menus as $menu){
                $sitemap->add(url($menu->alias . '.html') , $menu->updated_at, 0.9, 'monthly'); //daily
            }
        }       
        if(count($articles) > 0){
            foreach ($articles as $article){
                $sitemap->add(url($article->alias . '.html') , $article->updated_at, 0.9, 'monthly'); //daily
            }
        }       
        if(count($products) > 0){
            foreach ($products as $product){
                $sitemap->add(url($product->alias . '.html') , $product->updated_at, 0.9, 'monthly'); //daily
            }
        }       
        if(count($projects) > 0){
            foreach ($projects as $project){
                $sitemap->add(url($project->alias . '.html') , $project->updated_at, 0.9, 'monthly'); //daily
            }
        }       
        if(count($organizations) > 0){
            foreach ($organizations as $organization){
                $sitemap->add(url($organization->alias . '.html') , $organization->updated_at, 0.9, 'monthly'); //daily
            }
        }       
        if(count($project_articles) > 0){
            foreach ($project_articles as $project_article){
                $sitemap->add(url($project_article->alias . '.html') , $project_article->updated_at, 0.9, 'monthly'); //daily
            }
        }             
        $sitemap->store('xml', 'sitemap');
        @copy(base_path('public'.DS.'sitemap.xml'),base_path('sitemap.xml'));
        unlink(base_path('public'.DS.'sitemap.xml'));
        $fp=fopen(base_path('robots.txt'), 'w');        
        $content=
        'User-agent: *
        Disallow: /app/
        Disallow: /bootstrap/
        Disallow: /config/
        Disallow: /database/
        Disallow: /document/
        Disallow: /public/
        Disallow: /resources/
        Disallow: /routes/
        Disallow: /storage/
        Disallow: /tests/
        Disallow: /upload/
        Disallow: /vendor/
        Disallow: /.env
        Sitemap: '.url("sitemap.xml");
        fwrite($fp, $content);
        fclose($fp);
    }
}
