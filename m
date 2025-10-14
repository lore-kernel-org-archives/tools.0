Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2422FE04B
	for <tools@linux.kernel.org>; Tue, 14 Oct 2025 21:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760476665; cv=none; b=h0IudLTxYF9GeWepo5+4PskKoEEWkTqTxbu4U+KCn9UORfDtU3Xf5i0tyuhSfXLmf9eaXo9K20Bz0+ndGkqjKOJl9sBoFfdECKiSrU+a+L1JIQQBitIZmfeiY7pBCd9QZHECgQ1gKML07Rt31ttdYeLOcl9VGmPJ0PbE1YdIAY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760476665; c=relaxed/simple;
	bh=lz5/a3k5A0OUzD032f3fXYym+8U/C9ySBdXd8PvCY18=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ucURKXq/nHa9M+bIjjn+W/RGoIaV+/G9JScmeld0gfwl72BHHM8odFGCIwfLubxafJHgSqfqetcvfHaxhcccmSrcGveEh4a5NnXjlRTorIUfuwpEPb/mcl+7lzTvCTISjlv2miSdOvQ/AdxM2E0EbUkpJHjMSsEkegFIpft8eJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZuQoOlmK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZuQoOlmK"
Received: by smtp.kernel.org (Postfix)
	id 887F4C4AF09; Tue, 14 Oct 2025 21:17:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CA05C4CEF1;
	Tue, 14 Oct 2025 21:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760476665;
	bh=lz5/a3k5A0OUzD032f3fXYym+8U/C9ySBdXd8PvCY18=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=ZuQoOlmKz4bBGeqSE13TfvHbTV651L+tKN/chaAPPSb0PuSmkK89/o8ZduHda7/IQ
	 XQFCoQYTjbz5C/k1AJtSGtMvEnR1GLRO7eYMnStmC5WLhS211Ncx5JQVD41Mwl5ImP
	 YyChlmO5tpfLztvv6k4hZrbSLU0aG1VAunVCbcKM=
Date: Tue, 14 Oct 2025 17:17:43 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: users@kernel.org, tools@kernel.org
Subject: Re: [b4] initial "b4 dig" to supplant Link: trailers
Message-ID: <20251014-gorgeous-cougar-of-endeavor-0c5baa@lemur>
References: <20251010-muscular-camel-of-acumen-00eeaf@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251010-muscular-camel-of-acumen-00eeaf@lemur>

On Fri, Oct 10, 2025 at 04:47:27PM -0400, Konstantin Ryabitsev wrote:

Seems working on this right before disappearing for the long weekend due to
Canadian Thanksgiving was not the best choice. :)

I've carefully read everyone's feedback, and made significant changes to how
"b4 dig" operates. Specifically:

"b4 dig -c [commitish]" will now output a single link to stdout (all other
output going to stderr), so that it can be piped to other commands. It should
be the latest matching patch received by lore prior and including the "author
date" of the commit. This weeds out all ensuing backports and cherry-picking
efforts.

E.g.:

    $ b4 dig -c 57ce9f7793b714fb14a97d502ce926162c3b96b1
    Digging into commit 57ce9f7793b714fb14a97d502ce926162c3b96b1
    Attempting to match by exact patch-id...
    Trying to find matching series by patch-id ec28d569f47e7a709cc4e8ca022480ded520d928 (myers)
    Grabbing search results from lore.kernel.org
    Found matching series by patch-id
    Will consider promising messages: 3
    Looking up https://lore.kernel.org/r/20251006190854.103483-2-pc@manguebit.org
    Looking up https://lore.kernel.org/r/20251006164220.67333-2-pc@manguebit.org
    Looking up https://lore.kernel.org/r/20251007192326.234467-2-pc@manguebit.org
    ---
    [PATCH v3 2/4] smb: client: fix missing timestamp updates after ftruncate(2)
    https://lore.kernel.org/r/20251007192326.234467-2-pc@manguebit.org

"b4 dig -c [commitish] --all-series" will now try to find all the series where
that patch belongs and try to get you links to all prior revisions, even if
they don't have that very patch (e.g. because it only appeared in v3).

E.g. for the same commit:

    $ b4 dig -c 57ce9f7793b714fb14a97d502ce926162c3b96b1 --all-series
    Digging into commit 57ce9f7793b714fb14a97d502ce926162c3b96b1
    Attempting to match by exact patch-id...
    Trying to find matching series by patch-id ec28d569f47e7a709cc4e8ca022480ded520d928 (myers)
    Found matching series by patch-id
    Will consider promising messages: 3
    Looking up https://lore.kernel.org/r/20251007192326.234467-2-pc@manguebit.org
    Looking up https://lore.kernel.org/r/20251006164220.67333-2-pc@manguebit.org
    Looking up https://lore.kernel.org/r/20251006190854.103483-2-pc@manguebit.org
    Grabbing search results from lore.kernel.org
    ---
    This patch belongs in the following series:
    ---
      v1: [PATCH 1/3] smb: client: fix missing timestamp updates with O_TRUNC
          https://lore.kernel.org/r/20251006164220.67333-2-pc@manguebit.org
      v2: [PATCH v2 1/3] smb: client: fix missing timestamp updates with O_TRUNC
          https://lore.kernel.org/r/20251006190854.103483-2-pc@manguebit.org
      v3: [PATCH v3 1/4] smb: client: fix missing timestamp updates with O_TRUNC
          https://lore.kernel.org/r/20251007192326.234467-2-pc@manguebit.org

This change addresses the following known annoyances:

> 1. We don't currently weed out AUTOSEL/stable backports, so older commits may
>    end up in lots of false positives for now. I've not yet figured out how to
>    avoid this without hardcoding it to be kernel-specific.

This should now be filtered out due to limiting results by commit date.

> 2. Patches that were sent as part of one series and then as part of another
>    series (by the same author) don't currently do the right thing.

This should be doing the right thing now, but needs more testing.

-K
