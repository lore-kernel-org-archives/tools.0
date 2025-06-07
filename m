Received: from dcvr.yhbt.net (public-inbox.org [173.255.242.215])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E08360
	for <tools@linux.kernel.org>; Sat,  7 Jun 2025 00:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.242.215
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749254700; cv=none; b=k8SmvPYWf946QJNi9NDwRGo1i0u1X3l1KFX+couhh9e8RhGEKUDK7FlKU87phmelaxgqWl47va0Pga1Cvg6VnigZoiSQDy5muOQAoy33VmLKbd+v7hLEoRSqUCOetTCicbfgtrb4L0B7KysocIFVE++5fhMVgLU8Fhd4oPBxb3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749254700; c=relaxed/simple;
	bh=Nzk3dyqPUDrvvKp5S+MpRnZN9OljUQ9HhyLX70dYP78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BuqcovN86FM/SQ+pnPHBblGdiaFBqeGpD2kT3amLflIqP6oE7QSdxBjLqYbDZTeybCkqDg1DMiHQMorUks6qPTmPJbeZDEvmHjnuX2uTGRoSPA1QJ1GoyhSPRDql0s/80g6pusiCypzP20LSGhqCRGEN97G8jJVWOpur76CvmTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=80x24.org; spf=pass smtp.mailfrom=80x24.org; dkim=pass (1024-bit key) header.d=80x24.org header.i=@80x24.org header.b=2J1fNmWe; arc=none smtp.client-ip=173.255.242.215
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=80x24.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=80x24.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=80x24.org header.i=@80x24.org header.b="2J1fNmWe"
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
	by dcvr.yhbt.net (Postfix) with ESMTP id E64F41F4E6;
	Sat,  7 Jun 2025 00:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=80x24.org;
	s=selector1; t=1749254698;
	bh=Nzk3dyqPUDrvvKp5S+MpRnZN9OljUQ9HhyLX70dYP78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2J1fNmWel3iB0qE0X02a5MypEa1boNrxdWuUX4SBl9X1VTrh/S6V0jL+78wDn/24c
	 O4hMIt2Gpb2+YXhqKSusD/6H0fz3oq/UYp4BeLceHQkFqj008cUAjhFqGwaKiJNUEr
	 0znMdMxSRVxAjdG9YOnoNydlcgKiQT7VZs8nre+o=
Date: Sat, 7 Jun 2025 00:04:57 +0000
From: Eric Wong <e@80x24.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: tools@linux.kernel.org, users@kernel.org, meta@public-inbox.org
Subject: Re: Does anyone have any tips for efficient lei and dovecot
 integration?
Message-ID: <20250607000457.M642647@dcvr>
References: <0bb9762f3bcee7b185f1eabc6c88859c0bf6f4ac.camel@HansenPartnership.com>
 <20250606180218.M374829@dcvr>
 <014a1fdf240ef70f00dd8dd2bfcde7b234b41e31.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <014a1fdf240ef70f00dd8dd2bfcde7b234b41e31.camel@HansenPartnership.com>

James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
> Thanks.  --no-import-before seems to have stopped store growing ... is
> there any way I can shrink it?

Not easily in a fine-grained way.  I *think*
`rm -rf ~/.local/share/lei/store' (but keeping
~/.local/share/lei/saved-searches) should be OK but I haven't
tested.  Theoretically we could add support for purging
individual messages from it (like public-inbox-purge).

You can also use normal git-gc || SQLite VACUUM ||
xapian-compact to reduce space losslessly.  We can probably add
`lei compact' to wrap xapian-compact similar to what
public-inbox-compact does; and probably add SQLite VACUUM
support to both of those xapian-compact wrappers.

> On Fri, 2025-06-06 at 18:02 +0000, Eric Wong wrote:
> > AFAIK, dovecot uses inotify||kevent to detect changes to its
> > Maildirs.  I never needed to run `doveadm force-resync' after
> > writing with 3rd-party tools (e.g. lei, mutt) to Maildirs used
> > by dovecot.
> 
> Well, it can, yes, but my setup is a fraction of a terrabyte of imap
> running all my subscriptions, which is pretty huge and fanotify can be
> a bit unscalable in something that big, so I have it turned off and I
> simply used dovecot-lda for local delivery via procmail to make sure
> everything got noticed immediately.

Ouch, yeah.

I actually have an idea to flip things by exposing lei/store
data as Maildirs via FUSE3 so there'd be no need for Maildirs
on regular FSes at all.

I'm not sure if the performance of the mainline perl
implementation + FUSE3 shim will be fast enough to handle
lots of small files even w/ readdirplus.  Or just bypass Perl
and just use FUSE3+SQLite+git but there's still syscall
amplification from all those layers.


sidenote: I completely forgot fanotify exists since the
early versions required CAP_SYS_ADMIN :x
