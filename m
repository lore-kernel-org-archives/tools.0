Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280242DE6F5
	for <tools@linux.kernel.org>; Tue, 14 Oct 2025 21:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760476905; cv=none; b=bir17M9c8t9BI99TWv0g4VLkQ2BTMB7jFoURy2RkbZFtt2IXVa+Iwowqyu8Nm0Ab4Gy0z/wigGon4A02mApA4e6eqPdol1Rw6iFbPoVx2h+OKuWvqjuMadpRlmV+ZTig/xUrD3rLfF9LRz/hddUG5tIIO7RS2XTpEE7R624JNg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760476905; c=relaxed/simple;
	bh=9bm8IAIivUWDsmCeICn/VBVEcW29+NmWYgseOet1kog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sv3sGaWotBbGetfOn/p+0sZeGx8qeFu6g67tBUOOHVOLPvFY5r/+rba9kHcGxYG6vvRvTgJyo5oh1QjpoDIpRDA3JTaa05mqe9t16D+2oYM0RLDH/cck4B/6PfJzI+dknfkLRdK+Ls89AWqS8G0jFefut3dyb1xoAERiCGKIAWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pgU+DesX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pgU+DesX"
Received: by smtp.kernel.org (Postfix)
	id D79F6C116C6; Tue, 14 Oct 2025 21:21:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C98FC4CEE7;
	Tue, 14 Oct 2025 21:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760476904;
	bh=9bm8IAIivUWDsmCeICn/VBVEcW29+NmWYgseOet1kog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pgU+DesXtNrJg1fpLL3f2UyFxbwIBAb5sliUXnqVVrKB1gpeTji+DIpODZpvw3BFg
	 C+wH/9JUeQ5CyuTUao54Mda9HXKMamd4KXih3K6yAcSMegwnlmej9JdKZHUMuRgxQD
	 jr85DdZrOPVdtshOo4RROgV2+NxGN54Y9bcBfkxg=
Date: Tue, 14 Oct 2025 17:21:42 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: tools@kernel.org, users@kernel.org
Subject: Re: b4 am no longer prints file name
Message-ID: <20251014-pragmatic-dancing-kangaroo-613cdd@lemur>
References: <CAMuHMdX40JoouK0yjm_-ggj5dQ9MtE2vrYhUOQ9dDpCN-0+tXg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdX40JoouK0yjm_-ggj5dQ9MtE2vrYhUOQ9dDpCN-0+tXg@mail.gmail.com>

On Tue, Oct 14, 2025 at 06:03:58PM +0200, Geert Uytterhoeven wrote:
> Hi Konstantin,
> 
> Thanks for your hard work on b4!
> I wanted to try "b4 dig", so I upgraded.  After that, I noticed that
> "b4 am <Message-Id>" no longer prints the actual filename where it saved
> the mbox.  Hence I now have to do a manual look-up.  Apparently this
> was dropped in commit 8c0f498752924b3d ("mbox: refactor how we treat
> base_commit for am and shazam").
> 
> Perhaps this printing can be reinstated?

Yes this is a regression.

bugspray tag me
