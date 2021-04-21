Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1176B2F9B
	for <tools@linux.kernel.org>; Wed, 21 Apr 2021 23:43:46 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kyleam.com; s=key1;
	t=1619048625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JHh6p3rk1TAZrNiyDORC8FmJBdC2N04piueRPdY1hPU=;
	b=vdAi65VMXHeWhWx31wob3cqzlSYA5PFCn9SSVhQx5F9YS/6Z+zPE5CJm9KHh+CZclJebb9
	5f7Reow3Z3yVsPx2COxiO9jyKtSQMudly8WX0XaAWiT4xP2IBYet6KZGjaa4mTQUu4uuzi
	nqc9DBAFoGbTxv2dhtqAFgUVdYik2vd0AlFJnQyi0Du07nTBLsq8a583gu9AVhh+2EC56O
	7nrBVBY3JWIrXMdziwvaEaR7MZVUFFqBDIRzB6gAywvopooZALkPNhq7qtdY4JZoDyXcXe
	10NVuLo2p0h56D9QjMWO4DP1617xN0gUokMCwmGmhpqMYs2AxwwWg6ev2tOpmQ==
From: Kyle Meyer <kyle@kyleam.com>
To: tools@linux.kernel.org
Subject: Re: [PATCH b4] Delay dns.resolver.get_default_resolver call
In-Reply-To: <20210208040722.31203-1-kyle@kyleam.com>
References: <20210208040722.31203-1-kyle@kyleam.com>
Date: Wed, 21 Apr 2021 19:43:44 -0400
Message-ID: <87fszji4pb.fsf@kyleam.com>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: kyle@kyleam.com

Kyle Meyer writes:

> When b4.attestation-policy is 'off', calling `b4 am` with
> --use-local-mbox is conceptually an offline operation, but it still
> requires being online because get_default_resolver() is called at the
> top-level of b4/__init__.py.
>
> Support offline operation by delaying the call to
> get_default_resolver() until it's needed.  Note that
> get_default_resolver() already caches the result, so there's no need
> for b4 to store the result as a global variable on its end.

Any thoughts on this patch?
