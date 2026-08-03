Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2A0331A6E
	for <tools@linux.kernel.org>; Mon,  3 Aug 2026 19:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785784054; cv=none; b=SdVkZWNsOpaF0iF+YzAog3RNgUAqJC1N1gvyjNkyP8PHFPo4D7TwU8PPNC48OanAXSxiF8ilIEQaWal6/BV0qe+BQJdQBLedmetmOzewMfUE1WS5CmAiGwKk9meBXlwut1wbpoIyv3evCka9oyfqtpcw7Ckncgz2FDB9Vu9HnoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785784054; c=relaxed/simple;
	bh=6DpcA1sojRfscGGUS4+Go8DptkD1WHpsFaZ5qVcnOJQ=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=FURwl5KqBs0rNVEa0RkefEDEPxQvvGW2c7/kxag0D/pi5ypV0ZCYe+qh/vqJb8KiyXMVnHwZTNKdje2qRbsWdxzgha4HL1sjE4Vs5s0Az9TNopJYMDGV1AGCrtjn+gg0gjZ73h2Sl9Y7sODNeQRtH1r1Sf1oqii5yEYUjTFMxds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=F6CDMM4g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="F6CDMM4g"
Received: by smtp.kernel.org (Postfix)
	id 8FF911F00A3A; Mon,  3 Aug 2026 19:07:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 237921F000E9;
	Mon,  3 Aug 2026 19:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785784052;
	bh=UJ8Jp9avp5dODYMgwpSM+xT2XKwTCEtt87Cb1e2MQ1Q=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=F6CDMM4gCyWbK74t9pI8OPoTIJ71NAqxqgbJNMGDDE0TSNwm/SNJXK9JBvarrOosS
	 VrLjPAAPOINoRI/zYwL9iQic8OK5oA3pNtPORcjiy5+19dCgE/zP+FuNP3BYGeySwb
	 a0Who/DmzuwchW++8uaH0sciuYuanwKCsNwv6BH8=
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH b4] prep: add --cleanup-older-than option to clean up
 stale branches
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Breno Leitao <leitao@debian.org>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, kernel-team@meta.com
In-Reply-To: <20260323-cleanup-v1-1-cbf209f3de43@debian.org>
References: <20260323-cleanup-v1-1-cbf209f3de43@debian.org>
Date: Mon, 03 Aug 2026 19:07:24 +0000
Message-Id: <178578404438.357789.17589596756429737801.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1894;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=6DpcA1sojRfscGGUS4+Go8DptkD1WHpsFaZ5qVcnOJQ=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLIKnn3YeGdOg8yr+6eLfafnnQwPmiPbaGjyJXD55gOR8
 fPnTS060FHKwiDGxSArpshSti92U1DhQw+59B5TmDmsTCBDGLg4BWAiJr2MDO2OZQ6bTL/JC13X
 VX6t1vOlQ1RMXX7qwifZq+aqFb4S8GJkuPrk1qHaFRFnfFftDeA21MpNKL1as2O57vlyp/Sai00
 FbAA=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

> B4 is so useful that I have too many branches now, create a way to
> easily remove old branches.
> 
> Add a new --cleanup-older-than DAYS option that archives and removes
> prep-tracked branches whose latest commit is older than the specified
> number of days. Each matching branch goes through the normal per-branch
> confirmation prompt.

Sorry this sat so long -- I missed it initially and just caught up to it
now going over old series submissions. It needs rebasing, but I don't
see why not to take it.

> diff --git a/src/b4/command.py b/src/b4/command.py
> index ca7f238..2d263de 100644
> --- a/src/b4/command.py
> +++ b/src/b4/command.py
> @@ -401,6 +401,8 @@ def setup_parser() -> argparse.ArgumentParser:
>                         help='Show series info in a format that can be passed to other commands.')
>      spp_g.add_argument('--cleanup', metavar='BRANCHNAME', nargs='*',
>                         help='Archive and remove prep-tracked branches and all associated sent/ tags')
> +    sp_prep.add_argument('--cleanup-older-than', metavar='DAYS', type=int, default=None,
> +                         help='Archive prep-tracked branches older than DAYS days')
>  
>      ag_prepn = sp_prep.add_argument_group('Create new branch', 'Create a new branch for working on patch series')
>      ag_prepn.add_argument('-n', '--new', dest='new_series_name',

Suggestion: add it to `spp_g` instead of straight to sp_prep
(`spp_g.add_argument('--cleanup-older-than', ...)`), right next to
`--cleanup`.

Minor nit: the help text says "Archive prep-tracked branches older than
DAYS days", but the operation also removes the branch (like
`--cleanup`'s help text, which says "Archive and remove..."). Worth
aligning the wording so it's not surprising that the branch is deleted,
not just archived.

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
