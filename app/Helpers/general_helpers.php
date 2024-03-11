<?php

if (!function_exists('getTimezoneOffset')) {
    /**
     * Get the timezone offset from UTC.
     *
     * @param string $timezone
     * @return float|null
     */
    function getTimezoneOffset(string $timezone): ?float
    {
        try {
            $datetime = new \DateTime('now', new \DateTimeZone($timezone));
            $utcTime = new \DateTime('now', new \DateTimeZone('UTC'));

            $offset = $datetime->getOffset() - $utcTime->getOffset();
            $hours = $offset / 3600; // Convert to hours
            return $hours;
        } catch (\Exception $e) {
            // Handle invalid timezone or other exceptions
            return null;
        }
    }
}
