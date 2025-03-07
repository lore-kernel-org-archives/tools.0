Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A0519E999
	for <tools@linux.kernel.org>; Fri,  7 Mar 2025 09:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741339190; cv=none; b=pa+1+YgQfnKWjKnu2mpS5aDdOuiEdjK1u9rVpmtoFhHzHB3eYre/oLbWUyvL8EVe1ICPYnuGW8Pshmmy7E13ZDMOT28WCgO/wgMG7njQjHA+9lki0guHjhm3wgArFZD2iyUx839fpiRD5KtQm+2E+b1xPN1eTLr1lh8LZmRtUSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741339190; c=relaxed/simple;
	bh=E/HAZSC48ul34+aTHzvk48yGdJ3Ro3Q71LTfMQ38GII=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=obLIonN5t2/q+5GddN6GGnSjnIU2jUqUBalgLdRcMsZr8tzQrLEF3cysfUHbNNmRyp00MiW6zxmWG2Xii9NwDx3koIcapJS1pxU2ApLO82fDIMEp1Pt9UOAZvLTd/L7zytupyF7Vb79sDi0p2+7oeV+CGdHcsW31XgJ37dP74jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bLAauAVe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bLAauAVe"
Received: by smtp.kernel.org (Postfix)
	id 007E7C4CEE2; Fri,  7 Mar 2025 09:19:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C9EE1C4CED1
	for <tools@kernel.org>; Fri,  7 Mar 2025 09:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C9EE1C4CED1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741339189; x=1772875189;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=E/HAZSC48ul34+aTHzvk48yGdJ3Ro3Q71LTfMQ38GII=;
  b=bLAauAVe+HcSHzgM9bzOEYp9bV8sKafju0a0A7D1N+gapDtCgYqRmoOm
   Wd5+utkRm1UGClaQ5AVMU4wvhlBIJp+KkiYlPSV+fn/DpRhtIFPmmaXSH
   OLHFWhgnbb5zBDe5tC1By+qOYEpRuV7a6v2A1RlT8tZVco7lnquTeREi5
   O+csG2Pk6Av8i6p6q3MyF9rmfHS/AeB4g1BJ2HVwiVgyrP3e59QQ2vV4P
   haQmEO29hkAYrfH/a5gHSEFHsKCwWhyldcN3fa9fyDyJsGtK18LWdFRtO
   B369oiAc5qdBZgoVI6/hDS+tmoqPsImebHTO/Hbkvbqgd0MtpAMwvU0ui
   Q==;
X-CSE-ConnectionGUID: xPpwb53oSpq0j6q52HoxEw==
X-CSE-MsgGUID: sEcc/dYQSSWLiq1+RjuCnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="59939943"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="59939943"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 01:19:48 -0800
X-CSE-ConnectionGUID: Ue+l8haCQ16UAMuNryjR8A==
X-CSE-MsgGUID: dkTZ56hERmO3bwv1eAx0fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="156487526"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.179])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 01:19:46 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: tools@kernel.org
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: b4 emits color codes to pipes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Fri, 07 Mar 2025 11:19:43 +0200
Message-ID: <87ecz9i4eo.fsf@intel.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


I like to pipe emails from my MUA (notmuch-emacs) to 'b4 shazam'. It
works great, as b4 parses the mails and picks up the message-id from
there.

However, b4 seems to err on the side of emitting color codes to pipes,
and I get something like this as output:

---
  [32m=E2=9C=93[0m [PATCH v5->v6 1/6] drm/i915/hpd: Track HPD pins instead =
of ports for HPD pulse events
    + Reviewed-by: Jani Nikula <jani.nikula@intel.com> ([32m=E2=9C=93[0m DK=
IM/intel.com)
  [32m=E2=9C=93[0m [PATCH v5->v6 2/6] drm/i915/hpd: Let an HPD pin be in th=
e disabled state when handling missed IRQs
    + Reviewed-by: Jani Nikula <jani.nikula@intel.com> ([32m=E2=9C=93[0m DK=
IM/intel.com)
  [32m=E2=9C=93[0m [PATCH     v6 3/6] drm/i915/hpd: Add support for blockin=
g the IRQ handling on an HPD pin
  [32m=E2=9C=93[0m [PATCH v5->v6 4/6] drm/i915/dp: Fix link training interr=
upted by a short HPD pulse
    + Reviewed-by: Jani Nikula <jani.nikula@intel.com> ([32m=E2=9C=93[0m DK=
IM/intel.com)
  [32m=E2=9C=93[0m [PATCH     v6 5/6] drm/i915/dp: Queue a link check after=
 link training is complete
  [32m=E2=9C=93[0m [PATCH v5->v6 6/6] drm/i915/crt: Use intel_hpd_block/unb=
lock() instead of intel_hpd_disable/enable()
  ---
  [32m=E2=9C=93[0m Signed: DKIM/intel.com
---

I haven't had the time to dig into b4 source on this, but it would be
great if it could automatically detect whether sending colors is the
right thing to do or not. Basically only emit color codes to interactive
terminals, unless forced also for pipes. I presume this would mean
adding a new parameter --color=3D{auto,always,never} similar to git,
defaulting to auto.


Thanks,
Jani.


--=20
Jani Nikula, Intel
