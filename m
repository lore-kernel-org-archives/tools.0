Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web09.9839.1607532775715433969
 for <tools@linux.kernel.org>;
 Wed, 09 Dec 2020 08:52:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: 134.134.136.65, mailfrom: andriy.shevchenko@linux.intel.com)
IronPort-SDR: CcBNdnTmDYdn8Ikq7D7gIw4GA7WdQIt4tumtGkzyKTf35UI5NlPqJ0uGpmGiH1hz+yD5KZEBqa
 /H+pLfNKbARQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9829"; a="174226540"
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; 
   d="scan'208";a="174226540"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2020 08:52:55 -0800
IronPort-SDR: PCk7wBKLP6ZV+hijQXAbxmdD2HRoNo8IXyTPbIcx+vgSzna0r6BmU1pR499p3TZAZgUvjtBZeF
 E1ZVtfHVJwbg==
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; 
   d="scan'208";a="408127015"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2020 08:52:54 -0800
Received: from andy by smile with local (Exim 4.94)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1kn2iy-00DBD3-6K; Wed, 09 Dec 2020 18:53:56 +0200
Date: Wed, 9 Dec 2020 18:53:56 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	tools@linux.kernel.org
Subject: Re: b4 strips BiugLink
Message-ID: <20201209165356.GT4077@smile.fi.intel.com>
References: <CACRpkdZrth39GdKc0OFF9cDNHq2hBOXq1f-uU=TOOT8GaogoMQ@mail.gmail.com>
 <20201209131924.bai7b4tj2wb7sbon@chatter.i7.local>
 <CACRpkdYA9T9msayNQrd5X+oXnr5_MtGQTEmUkpsAF+LALEdt8w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACRpkdYA9T9msayNQrd5X+oXnr5_MtGQTEmUkpsAF+LALEdt8w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 09, 2020 at 03:40:40PM +0100, Linus Walleij wrote:
> On Wed, Dec 9, 2020 at 2:19 PM Konstantin Ryabitsev
> <konstantin@linuxfoundation.org> wrote:
> 
> > Okay, there is a fix in master and stable-0.6.y that adds BugLink to the
> > list.
> 
> Wow that's quick!
> 
> Thanks a lot Konstantin!

Thanks!

Btw, can b4 print a warning if it cuts an (unknown) tag?

-- 
With Best Regards,
Andy Shevchenko


