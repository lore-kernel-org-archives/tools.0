Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFD8263F46
	for <tools@linux.kernel.org>; Fri, 14 Feb 2025 13:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739538534; cv=none; b=uoTNDUb0BgGRZS3ElGXPa8e2iYH/fBNrv920tIlNqvytfZyc5w7YQ9sYk3k8e89OdVQA4WVnflSajgE1MGdXYGc1l6GfSw+53YWfsPiyLH73xYorlbhqSp3rgJNxUzmgIK6jCtmgOmWXPJHVPpKeAh3F+ovvLcUptPxwkE3ee3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739538534; c=relaxed/simple;
	bh=knhLyi8nAdDBiQ884J4ttYxg3tdtipK2pSM/96pWeRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T8lqO2W3FlTDaKUeoK+CSVvHhZGGTo14CnEnzu4dghBZc6PM/SssBfbbevxYNzquAInoR68d8sUGEN7fFHVAhNTiyVOJfsls1UwQQesvrUO7Y9FUtyAPDiJkbtLADzwWBeP0Wcq9RCODF8v3hpPL4/9UCY9bNwdB/LwrBULFguU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f8Np4lsb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f8Np4lsb"
Received: by smtp.kernel.org (Postfix)
	id B3BEAC4CEE6; Fri, 14 Feb 2025 13:08:53 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 30A18C4CED1
	for <tools@kernel.org>; Fri, 14 Feb 2025 13:08:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 30A18C4CED1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739538531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=knhLyi8nAdDBiQ884J4ttYxg3tdtipK2pSM/96pWeRg=;
	b=f8Np4lsbTA72Xud+LT55iXvCbQC2JU837B5K4EJ5QwuDHBuzRn6cczPsh0iyEmZLM3eeV0
	uY1+5DmVhV0ySldXsf8PhserYaXi2nY5R5XYlrqsxPIwE/kHZlF/AxNlfOfyXOaEe4A0BU
	l7tuopi4JPCda/sX/i0AZN2uwrIkzXA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-403-PgbMVrzmOQqUzw6OHoGyfQ-1; Fri,
 14 Feb 2025 08:08:49 -0500
X-MC-Unique: PgbMVrzmOQqUzw6OHoGyfQ-1
X-Mimecast-MFC-AGG-ID: PgbMVrzmOQqUzw6OHoGyfQ_1739538528
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5B00D1800982;
	Fri, 14 Feb 2025 13:08:48 +0000 (UTC)
Received: from localhost (unknown [10.2.16.12])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D18DE3000199;
	Fri, 14 Feb 2025 13:08:47 +0000 (UTC)
Date: Fri, 14 Feb 2025 08:08:46 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: Way to list pull requests with b4 or lore?
Message-ID: <20250214130846.GA743572@fedora>
References: <20250213144722.GA522528@fedora>
 <20250213-independent-tireless-hyena-41f604@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4MCY2jbxOTm6VRAC"
Content-Disposition: inline
In-Reply-To: <20250213-independent-tireless-hyena-41f604@meerkat>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4


--4MCY2jbxOTm6VRAC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2025 at 01:58:41PM -0500, Konstantin Ryabitsev wrote:
> On Thu, Feb 13, 2025 at 09:47:22AM -0500, Stefan Hajnoczi wrote:
> > Hi,
> > I've been using b4 and lore.kernel.org more and more recently, they are
> > awesome! Is there a way to list pull requests from b4 or lore?
>=20
> Happy to hear you find it useful. Can you clarify what you mean by "list =
pull
> request" -- do you mean, "show me if there are any outstanding pull reque=
sts
> that I haven't yet processed?"

Exactly.

If it looks at the git repo and checks which pull requests have been
merged that's ideal, but even just a list of pull requests (processed or
not) on the mailing list is useful.

Thanks,
Stefan

--4MCY2jbxOTm6VRAC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmevQF4ACgkQnKSrs4Gr
c8jXMQf/YuF21YxTf+OIiZyi2NISrDo8a3DSsnjPXt0d+SgN7jB/+hCSy6Q/13OL
BayRepbp/m2AyU3t9cs/0S7YAnTvPo6BdfoTx+P+anqw8FApnlmgok1W9mwrWLMY
0hIAJBksJO2ThVBfevseUMi3K5NPv/izfi2/msdaZOS2KyDBZDc53+9+Ldv5CtpW
8txoWP6jMuY1+VMnnqrfVQA9/tx2B0OBLjMbjntbFvXKDjOF7B0hHTPf8N6Xw1/A
j1LbCPF1+4Uiv0aUyLBACRH2Eg0an7swf+ZQ2cBlj8ULui6QwjCAyqfRTRHsoKPW
nlD6pZVyZntVfJbUi65y5kCcAgtRWg==
=zPtJ
-----END PGP SIGNATURE-----

--4MCY2jbxOTm6VRAC--

