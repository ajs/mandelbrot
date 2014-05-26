#!/usr/bin/env perl6

use v6;

my $max-iterations = 50;

my @color_map = (
    "0 0 0",
    "0 0 252",
    "64 0 252",
    "124 0 252",
    "188 0 252",
    "252 0 252",
    "252 0 188",
    "252 0 124",
    "252 0 64",
    "252 0 0",
    "252 64 0",
    "252 124 0",
    "252 188 0",
    "252 252 0",
    "188 252 0",
    "124 252 0",
    "64 252 0",
    "0 252 0",
    "0 252 64",
    "0 252 124",
    "0 252 188",
    "0 252 252",
    "0 188 252",
    "0 124 252",
    "0 64 252",
    "124 124 252",
    "156 124 252",
    "188 124 252",
    "220 124 252",
    "252 124 252",
    "252 124 220",
    "252 124 188",
    "252 124 156",
    "252 124 124",
    "252 156 124",
    "252 188 124",
    "252 220 124",
    "252 252 124",
    "220 252 124",
    "188 252 124",
    "156 252 124",
    "124 252 124",
    "124 252 156",
    "124 252 188",
    "124 252 220",
    "124 252 252",
    "124 220 252",
    "124 188 252",
    "124 156 252",
    "180 180 252",
    "196 180 252",
    "216 180 252",
    "232 180 252",
    "252 180 252",
    "252 180 232",
    "252 180 216",
    "252 180 196",
    "252 180 180",
    "252 196 180",
    "252 216 180",
    "252 232 180",
    "252 252 180",
    "232 252 180",
    "216 252 180",
    "196 252 180",
    "180 252 180",
    "180 252 196",
    "180 252 216",
    "180 252 232",
    "180 252 252",
    "180 232 252",
    "180 216 252",
    "180 196 252",
    "0 0 112",
    "28 0 112",
    "56 0 112",
    "84 0 112",
    "112 0 112",
    "112 0 84",
    "112 0 56",
    "112 0 28",
    "112 0 0",
    "112 28 0",
    "112 56 0",
    "112 84 0",
    "112 112 0",
    "84 112 0",
    "56 112 0",
    "28 112 0",
    "0 112 0",
    "0 112 28",
    "0 112 56",
    "0 112 84",
    "0 112 112",
    "0 84 112",
    "0 56 112",
    "0 28 112",
    "56 56 112",
    "68 56 112",
    "84 56 112",
    "96 56 112",
    "112 56 112",
    "112 56 96",
    "112 56 84",
    "112 56 68",
    "112 56 56",
    "112 68 56",
    "112 84 56",
    "112 96 56",
    "112 112 56",
    "96 112 56",
    "84 112 56",
    "68 112 56",
    "56 112 56",
    "56 112 68",
    "56 112 84",
    "56 112 96",
    "56 112 112",
    "56 96 112",
    "56 84 112",
    "56 68 112",
    "80 80 112",
    "88 80 112",
    "96 80 112",
    "104 80 112",
    "112 80 112",
    "112 80 104",
    "112 80 96",
    "112 80 88",
    "112 80 80",
    "112 88 80",
    "112 96 80",
    "112 104 80",
    "112 112 80",
    "104 112 80",
    "96 112 80",
    "88 112 80",
    "80 112 80",
    "80 112 88",
    "80 112 96",
    "80 112 104",
    "80 112 112",
    "80 104 112",
    "80 96 112",
    "80 88 112",
    "0 0 64",
    "16 0 64",
    "32 0 64",
    "48 0 64",
    "64 0 64",
    "64 0 48",
    "64 0 32",
    "64 0 16",
    "64 0 0",
    "64 16 0",
    "64 32 0",
    "64 48 0",
    "64 64 0",
    "48 64 0",
    "32 64 0",
    "16 64 0",
    "0 64 0",
    "0 64 16",
    "0 64 32",
    "0 64 48",
    "0 64 64",
    "0 48 64",
    "0 32 64",
    "0 16 64",
    "32 32 64",
    "40 32 64",
    "48 32 64",
    "56 32 64",
    "64 32 64",
    "64 32 56",
    "64 32 48",
    "64 32 40",
    "64 32 32",
    "64 40 32",
    "64 48 32",
    "64 56 32",
    "64 64 32",
    "56 64 32",
    "48 64 32",
    "40 64 32",
    "32 64 32",
    "32 64 40",
    "32 64 48",
    "32 64 56",
    "32 64 64",
    "32 56 64",
    "32 48 64",
    "32 40 64",
    "44 44 64",
    "48 44 64",
    "52 44 64",
    "60 44 64",
    "64 44 64",
    "64 44 60",
    "64 44 52",
    "64 44 48",
    "64 44 44",
    "64 48 44",
    "64 52 44",
    "64 60 44",
    "64 64 44",
    "60 64 44",
    "52 64 44",
    "48 64 44",
    "44 64 44",
    "44 64 48",
    "44 64 52",
    "44 64 60",
    "44 64 64",
    "44 60 64",
    "44 52 64",
    "44 48 64",
);


sub mandel(Complex $c) {
    my $z = 0i;
    my $i;
    loop ($i = 0; $i < $max-iterations; $i++) {
        if ($z.abs > 2) {
            return $i + 1;
        }
        $z = $z * $z + $c;
    }
    return 0;
}

sub subdivide-for($low, $high, $count, &block) {
    my $factor = (1.0 / ($count - 1)) * ($high - $low);
    loop (my $i = 0; $i < $count; $i++) {
        &block($i, $low + $i * $factor);
    }
}

sub mandelbrot($height, $width, $upper-right, $lower-left) {
    my @lines;
    subdivide-for($upper-right.re, $lower-left.re, $height, -> $i, $re {
        @lines[$i] = start {
            my @line;
            subdivide-for($re + ($upper-right.im)i, $re + 0i, ($width + 1) / 2, -> $j, $z {
                @line[$width - $j - 1] = @line[$j] = mandel($z);
            });
            @line.map(-> $value { @color_map[$value] }).join(' ');
        };
    });

    say "P3";
    say "$width $height";
    say "255";

    for @lines -> $promise {
        say $promise.result;
    }
}

sub MAIN(Int $height = 31, :$max-iter = 50) {
    $max-iterations = $max-iter;

    my $upper-right = -2 + (5/4)i;
    my $lower-left = 1/2 - (5/4)i;

    mandelbrot($height +| 1, $height +| 1, $upper-right, $lower-left);
}
