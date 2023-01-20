Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCD817CB
	for <tools@linux.kernel.org>; Fri, 20 Jan 2023 07:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674198572; x=1705734572;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=tKm+bO/Vgerfp3hhNVj9ktg62zDE7O3jfNPDVmPjMMI=;
  b=SKvixPE09hUzoixxVhxYsf0C70UIgVpROigRzF7UsPhkrbARjyWrDxQz
   8HDRfL4Js+Y7KuczFSq+b5ZBKTww8PRWNOtYTpVRUyT1Y1pnH+YqXISM2
   nl3sVMiIcO2PYGwG4LBYaObGm3WEXWLhHnhsKdnVcWmtsk2lL4VHtqmMd
   1V356pVLTHtsW3XuS/yiWRmqNj/v6Um2yrlXYq3YQ6qVMg35xgd0VdFtT
   cae6jOZc0DVbh9PpslkU9STJJV1ulV1lLnog0y2pV/dP2HSd/WDpmsU1G
   WXyo8b2stcwpHcZXvX2+IGL1Vrlvmm2qziX8w5LRbgVtoVQmWfRx1W5qf
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="390036147"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="390036147"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 23:09:23 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="692773205"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="692773205"
Received: from bjforde-mobl.ger.corp.intel.com (HELO localhost) ([10.252.29.176])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 23:09:21 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: tools@linux.kernel.org, dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>
Subject: Re: pr-tracker-bot for drm subsystem?
In-Reply-To: <87a670spdw.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <87a670spdw.fsf@intel.com>
Date: Fri, 20 Jan 2023 09:09:18 +0200
Message-ID: <87a62dadi9.fsf@intel.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Konstantin?

On Thu, 15 Sep 2022, Jani Nikula <jani.nikula@intel.com> wrote:
> Hey all, I'd be interested in having the pr-tracker-bot [1] set up for
> the drm subsystem, following the dri-devel mailing list [2] and
> notifying when the pull requests have been merged to either the drm-next
> or drm-fixes branches of the main drm repository [3].
>
> What would this require in terms of the tracker bot code?
>
> Is the idea that the service could be expanded to cover subsystems
> instead of just LKML and mainline, or would all subsystems have to set
> it up for themselves with their own cron jobs on their own servers?
>
> Other considerations?
>
>
> BR,
> Jani.
>
>
> [1] https://korg.docs.kernel.org/prtracker.html
> [2] https://lists.freedesktop.org/mailman/listinfo/dri-devel
> [3] https://cgit.freedesktop.org/drm/drm/

-- 
Jani Nikula, Intel Open Source Graphics Center
