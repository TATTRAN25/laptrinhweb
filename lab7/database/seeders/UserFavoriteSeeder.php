<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UserFavoriteSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('user_favorite')->insert([
            'user_id' => 1,
            'favorite_id' => 1
        ]);

        DB::table('user_favorite')->insert([
            'user_id' => 1,
            'favorite_id' => 2
        ]);

        DB::table('user_favorite')->insert([
            'user_id' => 2,
            'favorite_id' => 4
        ]);

        DB::table('user_favorite')->insert([
            'user_id' => 2,
            'favorite_id' => 5
        ]);

        DB::table('user_favorite')->insert([
            'user_id' => 2,
            'favorite_id' => 6
        ]);
    }
}