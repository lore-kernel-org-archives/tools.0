Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961723128CC
	for <tools@linux.kernel.org>; Thu, 29 Jan 2026 13:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769694675; cv=none; b=apsNPhLktwHRxPnA9domgsRjk9dEJ6cT3NgIA3YXXUwnpgbf7n7Edxsin/npaKkY1mXXS9lBSYVgiH2DonYSX9RcUVD25UHcj6vKAezjrbpKNMjG+P+SrKdU6/KAMcqPZtdKpB1GTbKwvooMd3r53M5ogy8RwI2uvX4rn+h2ki8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769694675; c=relaxed/simple;
	bh=g3vhDvQ9cjV3w9DHZZXRdC75Uf68pGEQWHEFgOh7uN0=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Subject:Cc:From:
	 References:In-Reply-To; b=KKyvxQeA3jNCYkYxeAhAf7Tm+JmFWGV522sXxoATHDiDZC2gP6fmoT/oRhck/bmEiQEmzlObHC2+m+nZEeywl3JMz8hKI1kcjFbmOsmSoJIbND2enVQU63CDCzf3tApfUf6sdYU8hhVkhSf1fXfAw8dl6gZzP5P4BT6oXXw7lZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Wp/pY/69; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Wp/pY/69"
Received: by smtp.kernel.org (Postfix)
	id 4B6ACC4CEF7; Thu, 29 Jan 2026 13:51:15 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5824CC116D0
	for <tools@kernel.org>; Thu, 29 Jan 2026 13:51:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5824CC116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4CD331A2B04
	for <tools@kernel.org>; Thu, 29 Jan 2026 13:51:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1F0F3606B6;
	Thu, 29 Jan 2026 13:51:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1A97D119A884F;
	Thu, 29 Jan 2026 14:51:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769694667; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=g3vhDvQ9cjV3w9DHZZXRdC75Uf68pGEQWHEFgOh7uN0=;
	b=Wp/pY/69HMvhTd3cfhmv2iNWAmGs/3rbwf+e4Okx37b9vrTgisJ6EC/9c9w+GlE4oK0gI2
	fq2RbUCgWWCwTL/z5PLlO49czZk1n1RLqTfdWMWWnjfT4kymOMmKw2D+qXYAgzc0sCz1e7
	ZL2sagJhwTIhXZmSB7M0NklQXwRZc0YJLni81o15+WQfCCsMQU3hlycsKcODjXbk8FwdOP
	6kxKidt3ISzvyTbBVoAhtdNNFCNdOztTyp46WFYBovg87UEgNmtEGShOyciUqPpUtz0N4J
	9o7SaZLY8JHUa5kXzy3VMWUxncp97VKWcweGxGQLLzNA0oa/moUdOTqX6DRsdA==
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Jan 2026 14:51:05 +0100
Message-Id: <DG14EHTYTJTN.2NQI0XSURUJIP@bootlin.com>
To: "Breno Leitao" <leitao@debian.org>
Subject: Re: [PATCH b4] send: Add --force-cover-letter to send separate
 cover for single patch patch series
Cc: "Kernel.org Tools" <tools@kernel.org>, "Konstantin Ryabitsev"
 <konstantin@linuxfoundation.org>, <kernel-team@meta.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20260127-force-cover-letter-v1-1-1ba8d7f9a64f@debian.org>
 <DG115TDKJFHA.2VQ4J0C51DKHX@bootlin.com> <aXteOVMUIKNzv2te@gmail.com>
In-Reply-To: <aXteOVMUIKNzv2te@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

On Thu Jan 29, 2026 at 2:21 PM CET, Breno Leitao wrote:
[...]
>> I do find myself needing the last use-case sometimes, when the series do=
es
>> not require a cover-letter.
>
> Why do you need this case? I undertand a cover letter is required for
> a multi patch series, so, it can have an easy merge commit when merging
> the series.

Some project ignore merge commits altogether, so I regularly see series wit=
hout
cover letters. Are merge commits that frequent? I'm not judging on whether =
it's
good practice or not, but introducing a --force-cover-letter option would m=
aybe
not leave room for having such a use-case in the future.

Antonin
