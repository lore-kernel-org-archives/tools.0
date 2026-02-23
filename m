Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A2426E6E1
	for <tools@linux.kernel.org>; Mon, 23 Feb 2026 14:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771858727; cv=none; b=iIKz7VU4iflIB+xwJfYt8J75eVmKJ+e+6gcMAbaA5J7Pf2kK/dpD80RQex0ANT68mHD4PxnwTFugFRDuH+vlsESKd/k4z+MsRz+zIXEKYVfXZ4YZCh/P4QSLg2xYanmjopF/jgXvGbLmKXcKEvej4/BBybZvSZaO8wWIWaFfnBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771858727; c=relaxed/simple;
	bh=g14olA4NLS5fdd2IO9bFaePKidCbHxLZ/UXKc8ynkFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F2qxdZJughpToL7oZjA6skd07AsiPVaXBiGa4dLCLhXY3w6sVC4NIbH1T8v6NngyXg4lPfqa+dhhEGEtvxK8hpNlQgH4NiNsVqAgA57a/y+POi5xNGq9ABHdxKB/2ITmqMnEt9zrYHQju0KK+kq8c/FlRYCtd2uz52vNp8xpPlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rcGlXiTe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rcGlXiTe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B79AC116C6;
	Mon, 23 Feb 2026 14:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771858726;
	bh=g14olA4NLS5fdd2IO9bFaePKidCbHxLZ/UXKc8ynkFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rcGlXiTeUWB0+/VykNpsSoPNr2XfWFeSqFN3G4YB+3tcialhZw4Hagt11amJqR5w5
	 20QkPVo9zw4UwJKa3XDo3StJ0gnvyFul+n/pK7rdTV2EidZXJWiSe7Hw/P6Q54Qe1x
	 ulDlaXWUN/lUR4VwvommcCsCFPmZmiOmLknc/cTE=
Date: Mon, 23 Feb 2026 09:58:45 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: korgalore chokes on rm commits
Message-ID: <20260223-coral-chital-of-vitality-a63b8e@lemur>
References: <5232d291-747a-441a-a4a9-f518352b70c3@app.fastmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5232d291-747a-441a-a4a9-f518352b70c3@app.fastmail.com>

On Fri, Feb 20, 2026 at 06:03:12PM +0100, Ard Biesheuvel wrote:
> korgalore.StateError: Commit 57b7006b98f00912504ce02ee9fdfd673d18cb79 does not have a message file.
>
> commit 57b7006b98f00912504ce02ee9fdfd673d18cb79
> Author: linux-crypto.vger.kernel.org <linux-crypto@vger.kernel.org>
> Date:   Mon Feb 9 20:28:44 2026 +0000
>
>     rm

Thanks for reporting this. The "rm" commits are a public-inbox mechanism for
removing messages from indexes without rewriting git history -- they carry a
"d" (deleted) file instead of the usual "m" (message) file.  There's also a
similar "purged" commit type used for content scrubbing that can have an empty
tree entirely.

Korgalore now detects commits without an "m" file and skips them as no-ops
instead of treating them as delivery failures.

The fix is on both master and stable-0.5.y. Can you please confirm that the
error is now gone? If so, I'll release 0.5.3.

Regards,
-- 
KR
