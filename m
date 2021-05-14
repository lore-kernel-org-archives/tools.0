Received: from out2.migadu.com (out2.migadu.com [188.165.223.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC3671
	for <tools@linux.kernel.org>; Fri, 14 May 2021 21:34:17 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kyleam.com; s=key1;
	t=1621027463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=73IxL8G/QdT6Gi2Ocn/PJiGpTk2SADpnKMUF3Ia8zFs=;
	b=CBVuI8QzJ4rVu8OcPkEHzDHw7EOAI7vPTFKVU0PP8Tm0mH2fARMrqtt3tlEWYyDEYLevSs
	OeTL/ZK95f1bGf8iAYpbeTbHhb1RboODQBlp0wuV4N0cPr6V3DZVVF7Mgrjrsld6Y2IuMY
	0c8OErO8V1JgmzyGJdFgD1ihlXT08oLH6ESWttq/G4inY3fIHzYu9LPejhMmd0q2mqdZjE
	5wmdPCZnoFZmY27HXmMowckKZZjUbA0y/1hr27yAJUymFfqIZ88KpK7RzJbrRQt3lP+5+s
	68I2WWQdwCui8/Z+wNW02a9ly/qouY2ic1XkolJ23K80EtVlEqbFP6E484DBag==
From: Kyle Meyer <kyle@kyleam.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: [PATCH b4] Delay dns.resolver.get_default_resolver call
In-Reply-To: <20210514203733.h4dlub7vvpu2x3jr@meerkat.local>
References: <20210208040722.31203-1-kyle@kyleam.com>
 <87fszji4pb.fsf@kyleam.com>
 <20210514203733.h4dlub7vvpu2x3jr@meerkat.local>
Date: Fri, 14 May 2021 17:24:21 -0400
Message-ID: <87sg2pxb3u.fsf@kyleam.com>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: kyle@kyleam.com

Konstantin Ryabitsev writes:

> Kyle:
>
> I reworked the current 0.7-dev version to remove the little hacks for caching
> that I added. I'm comfortable with how the latest dns-python module is doing
> it by default, so we just defer to it for doing whatever caching necessary.

Sounds good.

> This should allow it to be a fully offline operation again.

Confirmed.  Thanks.
