Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web12.4544.1607509380535510145
 for <tools@linux.kernel.org>;
 Wed, 09 Dec 2020 02:23:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: 134.134.136.31, mailfrom: andriy.shevchenko@linux.intel.com)
IronPort-SDR: 5d2QfodBVbru29PclPl3/5BtyE1v2jmSj76J+j0zK0edouxWX0fsVnK9ntohbf9zwVpTzn7UJX
 scMhUbU2x1LA==
X-IronPort-AV: E=McAfee;i="6000,8403,9829"; a="235652100"
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; 
   d="scan'208";a="235652100"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2020 02:22:59 -0800
IronPort-SDR: Fb8LGhbkRu31jNARVrLmn/DgOHIVLY3EZGOMKDt+uiCMK0JFjhZLQ3KWJB867FpFynNCgwu7v+
 ScyPd8hB058A==
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; 
   d="scan'208";a="407998857"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2020 02:22:58 -0800
Received: from andy by smile with local (Exim 4.94)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1kmwdc-00D4id-FJ; Wed, 09 Dec 2020 12:24:00 +0200
Date: Wed, 9 Dec 2020 12:24:00 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	tools@linux.kernel.org
Subject: Re: b4 strips BiugLink
Message-ID: <20201209102400.GP4077@smile.fi.intel.com>
References: <CACRpkdZrth39GdKc0OFF9cDNHq2hBOXq1f-uU=TOOT8GaogoMQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACRpkdZrth39GdKc0OFF9cDNHq2hBOXq1f-uU=TOOT8GaogoMQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 09, 2020 at 09:13:44AM +0100, Linus Walleij wrote:
> Hi Konstantin,
> 
> I ran into this situation with b4, when trying to apply this patch:
> https://lore.kernel.org/linux-gpio/CACRpkdY6gEi6pzuuFCdO_Lj1r23=HKCWF+N+QR-E7kWS8bBkjg@mail.gmail.com/T/#m4ed4e0b58f70c69a0105c73ae8ea7ce8a6f5e61d
> 
> The "BugLink" tag gets stripped.
> 
> Is this on purpose, like b4 strips all unknown tags?
> 
> It seems BugLink is important to Intel so we better allow it
> in that case.

FYI:

% git log --oneline --grep BugLink v5.10-rc7 | wc -l
772

% git log --oneline --grep Buglink v5.10-rc7 | wc -l
29

-- 
With Best Regards,
Andy Shevchenko


