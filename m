Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D50D31A55B
	for <tools@linux.kernel.org>; Wed, 11 Mar 2026 19:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773257032; cv=none; b=MPOyuxZEBMTLMajWjTEJ57NBZWMd6Hv6YlIVjbbabWj+FOGAMJxbZa28rbXk70fXHfMXeduShodCP7zaum6NlL7lR1nMJntS0awMBLwpxT4L/3jHfV0I2o5pCPClvmBRy+4Swbt0dAi8q2w8NQItPDzuwT8nHHth8B/r83pz/qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773257032; c=relaxed/simple;
	bh=UsuG0c52jDnfYIF+r/M0lwIAP4UUjMdXJuDqu2GjsVA=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=OleMzo4Fi/jwLXLc75PmBsO37sabDO2C0NhzVF6+mHCdOtcGRF2STEDAGhQA966L0R27qcg/DIYcDQ8CQXlKuJG1cMnuCDP0mWozpjFyhYko/tlOm7dBnJ+GccNDNmmagFRb6sQgCIAheT6W6IcGHGpg4FhSVnleTDQVyszrMAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=fOb+AbH2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="fOb+AbH2"
Received: by smtp.kernel.org (Postfix)
	id C5536C116C6; Wed, 11 Mar 2026 19:23:51 +0000 (UTC)
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D4FD4C2BC9E
	for <tools@kernel.org>; Wed, 11 Mar 2026 19:23:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D4FD4C2BC9E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12732165d1eso284689c88.1
        for <tools@kernel.org>; Wed, 11 Mar 2026 12:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1773257029; x=1773861829; darn=kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UsuG0c52jDnfYIF+r/M0lwIAP4UUjMdXJuDqu2GjsVA=;
        b=fOb+AbH2iWt2brMcFDwALEoCKzIcWCWUUyXV8UTZZfBhqJCJrZzBy3k7ilHIuXWEvh
         DbyVQabduBWuO3JC/dY44MFMVsMz4c81DnH9rlYG9S6dZWkdiu5mZGISpxYhn6HxqO0k
         T0tFQBWBaNEJ3roFpFmtnFnvBbzZ6/XAX84Hrnfs7t8cpTjUJc9sISyUrg9ZuL9VAF7U
         YRY4NUYFKewHgWTpMRxU+o9InX+0MgwiEL/D2+Ii/s8sl4MnRLyOsF6H9T5i+0J2YstV
         Rm0PjUBfodjW0ReLgX+7xb8NNAIWcHd3MU57nyi/HMPApKAt7DuZMtjbihuDtIQMXkj/
         Htug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773257029; x=1773861829;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UsuG0c52jDnfYIF+r/M0lwIAP4UUjMdXJuDqu2GjsVA=;
        b=o6NV02XE6uKJshsX+yk/GkICCM0DTHQonvK4kuEydJpW4eka+g8k8iGclB6cawCtmO
         qjMZp/58luzxARPkrNgvQEnEbUTEa8KnMaOo0hbBBof1/1dyN/BJjo372TKh+xGrRIj1
         D5HLshIURTVVWB9Buo6AR+i00yM2S+KQ3oX1OLAHo1J9sq/N24WeiVoZAszgq/ceBrrf
         sRZqwLTx9A9okQeLm0PgFr821RKtE2EE4PX9BDhHgGN+K/MCxVtppwFMdmFvOaEzXk0u
         lTvG7eNwuYDBErJi246UB2lLD3wJ9BR1vdlEU64tTZ6bOI8w70+Sf2n0f25hDeV1rLas
         l+Qw==
X-Gm-Message-State: AOJu0YwHHnNzyYgnpEQ6EvTU/t5NXWz96tFMa2q3IbYlQWyVtdO66bvL
	WJuwABOFDE2xlisZ8YYEEOV2XG2GJAHBbCQLmPZIc/94ShSXSWqQZuOZc90XmAAEdP4j0F+EtrH
	bYyC+
X-Gm-Gg: ATEYQzxMJZeIOGZHtzrFC0at32pPcLEGNxtN63j7g9kauO2BdcW0QhVuzYeXIm9rUmX
	S2tffOjpO8gz4s1iYFzRe26T4Q6SaPdw5dXgx2nxP2E52LPF92eJZ18InfFOoFqPDjn47cvGiTo
	V/5vBBw4k+nFZ+yZVpyj0mpmghC4btGGsP8BtLXXXAW9G8oz7LnOcqE6eDdccT8myuZGALXk10R
	CtY4rJ5byF916qYUEeb5fUXz+cT0p4YTCmW2uVXqmjFfvdvC3G+RhcVZ2Ix/qJPrEZMQK/VMM48
	ccAZwqdxmQbQwiNkA0b9KTqaa6dqXD12CS2SWFy4O2Ln2rJ8K6h4dwM1pTUEh9OGaCrqOIa56NC
	s6j82EKNs1pWPxCGmXZLitwP4JmfPgUt2TL9zAGlPtT8V2aon+YC6A/v+2LH5qp4+7kOcRVEiEi
	fVoF8UAavabQ0wjr4Uu1yZXDOT1kqOyvYu0ngASwf/zKYgkpL8iJPtcfg=
X-Received: by 2002:a05:7022:1283:b0:128:c1be:152b with SMTP id a92af1059eb24-128e77928fbmr1654323c88.4.1773257028371;
        Wed, 11 Mar 2026 12:23:48 -0700 (PDT)
Received: from localhost ([2605:fb40:0:c09:323a:5679:3782:80b8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be8aa4ecbdsm3550779eec.16.2026.03.11.12.23.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 12:23:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 13:23:46 -0600
Message-Id: <DH075K3CFDCN.1H9F4KKHIV7RD@brighamcampbell.com>
From: "Brigham Campbell" <me@brighamcampbell.com>
To: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>, "Brigham
 Campbell" <me@brighamcampbell.com>
Cc: <tools@kernel.org>
Subject: Re: [PATCH] Fix typo in maintainer docs
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260311074014.289088-1-me@brighamcampbell.com>
 <20260311-invaluable-attentive-gopher-dd0a55@lemur>
In-Reply-To: <20260311-invaluable-attentive-gopher-dd0a55@lemur>

On Wed Mar 11, 2026 at 8:39 AM MDT, Konstantin Ryabitsev wrote:
> It's not actually a typo. ;) Welcome to the Canadian spelling where we
> arbitrarily spell some things the US way and others the UK way, and many =
of
> them are correct both ways! Like enroll and enrol, which are both accepte=
d in
> Canadian spelling. *sigh*

Shoot, I should have thought to look that up before sending a patch.
Tricky Canadians! Anyways, thanks for taking the patch. If I find any
obvious improvement or quick fix to be made to the new `review` tooling,
I'll send out another.

Cheers,
Brigham

