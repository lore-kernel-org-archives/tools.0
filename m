Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD871C2D
	for <tools@linux.kernel.org>; Mon, 23 Jan 2023 13:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674479618; x=1706015618;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=6p6d8d0A0EQ/w0BUPthiORFjEs/2UH9nG7t++c03jZc=;
  b=CkO3T6EPRvxmUKXavMMZY9/qX8/341fFcfGGRlZ0Z7jynBkZSHh5Li5j
   LXdAE53hI8O7Lz+2JRvRFhpvSd2P+5IU8o69DcmCIUxUVoxy7H6BG9aNa
   ghq3zo8P6zEU0nubXE34TSMgKwpwXGFZ00I+zdCsNWqMIRULy5n6u4tNy
   WvorvC/R5qGXm4Eg4whF9PGZnmLWfJD7vWSry3vN/EYcO066pojjAKJYt
   jiWNbFpJQSgzrNJseNKwOyXwgFYX7hkVDDwvAgjNW9WrNAc/3ZnBX9BJk
   AhqWoYMaLNYE1KLREBO/JD8cB/1/fT1WIAjxvtPZktNSB5bzJKEGgCbe9
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="390537239"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="390537239"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 05:13:37 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="990400275"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="990400275"
Received: from possola-mobl.ger.corp.intel.com (HELO localhost) ([10.252.57.125])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 05:13:35 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, dri-devel@lists.freedesktop.org, Daniel Vetter
 <daniel.vetter@ffwll.ch>
Subject: Re: pr-tracker-bot for drm subsystem?
In-Reply-To: <20230120151024.nflfvgl55wfl6ppj@meerkat.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <87a670spdw.fsf@intel.com> <87a62dadi9.fsf@intel.com>
 <20230120151024.nflfvgl55wfl6ppj@meerkat.local>
Date: Mon, 23 Jan 2023 15:13:33 +0200
Message-ID: <871qnl8kci.fsf@intel.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, 20 Jan 2023, Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:
> On Fri, Jan 20, 2023 at 09:09:18AM +0200, Jani Nikula wrote:
>> 
>> Konstantin?
>
> Sorry, I didn't mean to scholz you around.

This reply alone was worth the wait. ;D

> The pr-tracker-bot is very much a
> bespoke solution for Linus, so adapting it to other subsystems is not very
> trivial, which is why I've been sitting on this request without any movement.
>
> The code for the bot is available here:
> https://git.kernel.org/pub/scm/linux/kernel/git/mricon/korg-helpers.git/tree/pr-tracker-bot.py
>
> I can take a look at it in the future, but at the moment I'm still not able to
> work on it, sorry. :(

I guess the question still stands: Regardless of who modifies the
tracker bot and when, do you think you could take on running it for
other subsystems, provided the changes are to your liking, or should the
subsystems adapt it and run their own?

If the latter, there's just not all that much incentive to make it nice,
especially so if you say it's not trivial. It'll just be copy and make
it bespoke for the other subsystem.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
