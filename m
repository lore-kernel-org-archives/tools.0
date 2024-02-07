Received: from mail.avm.de (mail.avm.de [212.42.244.94])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC1822EE5
	for <tools@linux.kernel.org>; Wed,  7 Feb 2024 09:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707298446; cv=none; b=ffwy8w7nlghsPXksXvGL8lbw9V31vLqEOnW/2uFAwtk9tBjdFUKxZ77uWtGAxJYiS4D0JN5qIljOjxEZ06LTocUqVjHEwyQTgLUYeDKzzrNLf5zqpmHGIWcJMW9rjFcBfT56doBLDm+2UMDfx98oN4qSRQAV8UfBnxOAf3v+LFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707298446; c=relaxed/simple;
	bh=JBeZKFYtaym55Qk1bH3ar+f+5htvmUMF3kgHvVEGdL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mc/olb5cPAI1PoW7VGZqOFP/sLa0nBjbpWqNiqp/ppelMcMja0lh+0CUJR56NyxTF+hD/ZfxvMbGNy8XZfFMYcpFMorgJr/fiNEy9RqGlGOcV+QcHp10VKU/PmCai9Bl4nKrsSTVZEt/rU9YoPPDCVCdf5QlgaqaAqyjTTfFPlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de; spf=pass smtp.mailfrom=avm.de; dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b=Yu56+7z6; arc=none smtp.client-ip=212.42.244.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b="Yu56+7z6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1707298440; bh=JBeZKFYtaym55Qk1bH3ar+f+5htvmUMF3kgHvVEGdL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yu56+7z6Pa6eciLEHXdDTJxUBZMTlOC8Q8HdOScUbCpIpnsg5xOP8x8zZ0yrMPvE7
	 vbkj+q3XjgfzcaHvgRIhE0AiXlY6NxVV3mIQHxVKzZYLsCHrifyNSjOO933mI4tg30
	 WFwf7W3/JXiseRCeLscbqhV3nhCsU2svmzOvTpDc=
Received: from mail-auth.avm.de (unknown [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Wed,  7 Feb 2024 10:34:00 +0100 (CET)
Received: from buildd.core.avm.de (buildd-sv-01.avm.de [172.16.0.225])
	by mail-auth.avm.de (Postfix) with ESMTPA id D01798029A;
	Wed,  7 Feb 2024 10:33:59 +0100 (CET)
Received: by buildd.core.avm.de (Postfix, from userid 1000)
	id 71A55180DCE; Wed,  7 Feb 2024 10:33:59 +0100 (CET)
Date: Wed, 7 Feb 2024 10:33:59 +0100
From: Nicolas Schier <n.schier@avm.de>
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: Re: [PATCH b4] ty: auto-matching: Do not consume commit decorations
Message-ID: <ZcNOh4qknjl2bHxt@buildd.core.avm.de>
References: <20240207-ty-do-not-consume-commit-decorations-v1-1-995e5ff6666b@avm.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240207-ty-do-not-consume-commit-decorations-v1-1-995e5ff6666b@avm.de>
Organization: AVM GmbH
X-purgate-ID: 149429::1707298440-A9622608-78B075E4/0/0
X-purgate-type: clean
X-purgate-size: 620
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean

On Wed, Feb 07, 2024 at 09:25:35AM +0100, Nicolas Schier wrote:
> From: Nicolas Schier <nicolas@fjasle.eu>
> 
> Disable decoration when reading git log output for getting a list of git
> commits.
> 
> Without '--no-decorate', commits that have branches or tags pointing to
> them, will not be recognised by subject as get_all_commits will assume
> that the decoration is part of the commits subject line, e.g.:
> 
>     (HEAD -> main, tag: v1.142, origin/main) Dummy commit subject

oh, I forgot to mention that this is only true for those having git
config log.decorate enabled.

Kind regards,
Nicolas
