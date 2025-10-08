<?php

/**
 * Locale Class Polyfill
 *
 * This is a minimal polyfill for the PHP intl extension's Locale class.
 * Used when intl extension is not available (macOS Sequoia issue).
 */

if (!class_exists('Locale')) {
    class Locale
    {
        public const DEFAULT_LOCALE = 'en';

        public static function getDefault(): string
        {
            return self::DEFAULT_LOCALE;
        }

        public static function setDefault(string $locale): bool
        {
            return true;
        }

        public static function acceptFromHttp(string $header): ?string
        {
            return self::DEFAULT_LOCALE;
        }

        public static function canonicalize(string $locale): ?string
        {
            return $locale;
        }

        public static function getPrimaryLanguage(string $locale): ?string
        {
            $parts = explode('_', $locale);
            return $parts[0] ?? 'en';
        }

        public static function getRegion(string $locale): ?string
        {
            $parts = explode('_', $locale);
            return $parts[1] ?? null;
        }

        public static function getScript(string $locale): ?string
        {
            return null;
        }

        public static function getAllVariants(string $locale): ?array
        {
            return [];
        }

        public static function composeLocale(array $subtags): string
        {
            return implode('_', $subtags);
        }

        public static function parseLocale(string $locale): ?array
        {
            return [
                'language' => self::getPrimaryLanguage($locale),
                'region' => self::getRegion($locale),
            ];
        }

        public static function filterMatches(string $langtag, string $locale, bool $canonicalize = false): ?bool
        {
            return $langtag === $locale;
        }

        public static function lookup(array $langtag, string $locale, bool $canonicalize = false, ?string $default = null): ?string
        {
            return $default ?? self::DEFAULT_LOCALE;
        }
    }
}
