<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class FavoriteSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {

        DB::table('favorities')->insert([
            'favorite_name' => 'Thể thao',
            'favorite_description' => 'Thích câu lạc bộ Real, Barca, MU, ...',
        ]);

        DB::table('favorities')->insert([
            'favorite_name' => 'Du lịch',
            'favorite_description' => 'Tôi yêu Việt Nam, tối muốn đi du lịch khắp mọi miền đất nước, ...',
        ]);

        DB::table('favorities')->insert([
            'favorite_name' => 'Xem phim',
            'favorite_description' => 'Tôi rất thích xem phim hoạt hình',
        ]);

        DB::table('favorities')->insert([
            'favorite_name' => 'Hay ho',
            'favorite_description' => 'Hay thích ho, ho lao, ho phổi,...',
        ]);

        DB::table('favorities')->insert([
            'favorite_name' => 'Thông minh',
            'favorite_description' => 'Thích thông minh',
        ]);

        DB::table('favorities')->insert([
            'favorite_name' => 'Thích code',
            'favorite_description' => 'code htmlol, code javarorant, code cssgo,..',
        ]);
    }
}