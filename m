Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606681;
	b=JTArPkOXj/G3QuFhhZ4Fs9fsNAvpGKEuMEHrlUVUrTbgbR1EWrmm8O7lFY9y1rd0rmBI
	 +geFOPW74E2x+D3FVZjQ+euTIyPgez2dnBKklBYoHfFHLIPthrsKWrWxPYVjaEPhETK6+
	 Bx4WreNU8BSWVAsWkx7YSJYTmL7qBBIeUu0cEoqACPPLu+sZ03Xvbm4H+YqL9I97g8V5m
	 QvrkUNIyvXa9OdtBzc12oVUQRU3wqlz4HMhABpgT1UjToaSlW57TFw7zpTUn+lZhgnggk
	 ieOmV80Q0OJH/DpdKqMP9Dl4zuO4wF4BadBIrYlVzm4S1GcOBbkoygdnzVrxii0ouig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606681;
	h=Received:Delivered-To:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=/ynicoMOsdgMoTpDaq72LSXnWczUp8lNrS5SNTJX4iA=;
	b=oP9U2iA7OQCvFh7qKpzB8ZEYG4cz7hkKzaKPUiIAgHn4BfK3gAZYfpupKpf85rHkbxNq
	 3bcZyGK1GmPsPArDddaKveCavtOwr/A65Mq307VRRlK5+QpbGpCZZstXNd5mYb9DyaGfl
	 ON5W8BY81Q6wyYhrOix/gQQSiBK9fHqMTDYeMUlEdkqTAagYcs07+NnV+O4S8xS3v0iec
	 Nh2gAQaDaPvp90hR27ZnIkslhfEjSZa0W2XpvNxO5uxXWJYeBtuQUXvpRV8QqIaavwTRx
	 ttDBhGdAAQ7ZA1mAkjOidJHVDMyevP/ZEbhnKpsKSM1hjiYeL/fkNzc8lwZXW3VsUWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=rnd8UzM5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14309606A880
	for <tools@linux.kernel.org>; Fri, 13 Nov 2026 21:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=rnd8UzM5
Received: by smtp.kernel.org (Postfix)
	id A3F4F1F000C5; Fri, 13 Nov 2026 21:51:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ACD81F000C4;
	Fri, 13 Nov 2026 21:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1794606680;
	bh=/ynicoMOsdgMoTpDaq72LSXnWczUp8lNrS5SNTJX4iA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=rnd8UzM5E9X4lNlSEZoVe79oJR9BF8Rushdl57nMcSqUf+gxKd6EKgYnL1QqELxfo
	 9Gr3sncnustU9GbxYa64Ib0706uW5Q+B1s2ff9GUnTrD1t9apf/C4pr3kBp0xg9+PI
	 LN+QAp+jQwkJ+lyyaCnLcphoC+x34HDW0N2GhSIE=
Date: Fri, 13 Nov 2026 16:51:19 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: [PATCH b4] review: Add a batch mode for agent reviews
Message-ID: <20261113-intrepid-fierce-bullmastiff-ccdc63@toolbx>
References: <20261111-batch-agent-v1-1-7296d20c2a43@kernel.org>
 <04b9c054-666d-48ea-91ec-20cd932b88d5@sirena.org.uk>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <04b9c054-666d-48ea-91ec-20cd932b88d5@sirena.org.uk>

On Fri, Nov 13, 2026 at 08:59:33PM +0000, Mark Brown wrote:
> On Wed, Nov 11, 2026 at 12:47:17PM +0000, Mark Brown wrote:
> > Agent reviews can take quite some time to run which is not ideal for
> > interactive use. Add a command 'b4 review batch agent' which runs an agent
> > review for everything that is currently in reviewing state, allowing users
> > to ingest a batch of patches then review them all non-interactively.
> > Allow this to be limited to a specific agent in case the user is working
> > with multiple agents and wants to use them all.
> 
> *sigh*, I realise I missed a git add on the new file - I'll resend on
> Monday unless you say you totally hate the idea before then.

I'm dealing with the fallout of Outlook's outage from yesterday (a bunch of IT
companies use outlook as their MX, so we had huge queues today). Go ahead and
send v2 and I'll review it once I'm done dealing with the fire-du-jour.
Hopefully, I can get through much of b4's own patch backlog in the next few
days.

-K
