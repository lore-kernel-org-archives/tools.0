Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288CB4683
	for <tools@linux.kernel.org>; Thu, 15 Sep 2022 14:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663250832; x=1694786832;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=Z7Lu2DWPRFF2nf/dGi8qHHlBq8bmy7c7kcLKhkB15FE=;
  b=AQLOYZRcbnhyaOZLBYETSpzYP8E/PCdMCX8RMBbwZVFOvyqYzOn0Bkk+
   58YNxZMBbll24vPslgsjv49QkLmlNIRaysEf4aqZ97B2gHsnxmOytTJi8
   mz70+KgNKNHbXzOJJDQrg2TmJdQAc9AvuzFVI5FpZpyw9WmX1+JYUWEc1
   RREGZJxedg+0m0PU4iTWx0oqu/+XKZ/IrYzauMgsWWfA5Eh4WFHIJnKt4
   N70HOn21cAs0kMNV1wQHGuVUE9o6YqS1j71ilbmiCsbuVTabMNM7cornO
   q2v3vNVKyzBulQpLeO9pWoDSxfGaq/o+Ye4losWy3wZYd+REi2xee20Zh
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="297448678"
X-IronPort-AV: E=Sophos;i="5.93,318,1654585200"; 
   d="scan'208";a="297448678"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2022 07:07:01 -0700
X-IronPort-AV: E=Sophos;i="5.93,318,1654585200"; 
   d="scan'208";a="742943216"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.146])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2022 07:06:58 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: tools@linux.kernel.org, dri-devel@lists.freedesktop.org
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Dave Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Daniel Stone
 <daniel@fooishbar.org>
Subject: pr-tracker-bot for drm subsystem?
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 15 Sep 2022 17:06:51 +0300
Message-ID: <87a670spdw.fsf@intel.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Hey all, I'd be interested in having the pr-tracker-bot [1] set up for
the drm subsystem, following the dri-devel mailing list [2] and
notifying when the pull requests have been merged to either the drm-next
or drm-fixes branches of the main drm repository [3].

What would this require in terms of the tracker bot code?

Is the idea that the service could be expanded to cover subsystems
instead of just LKML and mainline, or would all subsystems have to set
it up for themselves with their own cron jobs on their own servers?

Other considerations?


BR,
Jani.


[1] https://korg.docs.kernel.org/prtracker.html
[2] https://lists.freedesktop.org/mailman/listinfo/dri-devel
[3] https://cgit.freedesktop.org/drm/drm/

-- 
Jani Nikula, Intel Open Source Graphics Center
