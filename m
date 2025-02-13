Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018CC245027
	for <tools@linux.kernel.org>; Thu, 13 Feb 2025 14:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739458051; cv=none; b=VnaQYlHwht3T0u/jWRRsXd669stzUu21ml01MZPxXtIsbY42DzOF4100msX5dicksRVQ+GFGE9cFuP2S01SIrmMrtWC7KfWVGDBy5sZNo815iyA+aaLs2M3eUxDvsDivUHgePt70audH5q06O7SAorVu305KfOw0X/IY9utKv/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739458051; c=relaxed/simple;
	bh=RYuSXYma8k7548AIH+r25ugjbvnXtUAA+ahGIwSCjZI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mGb55xiIm/46Jc6pmZfVG/1MpcUkjclAqlvo11VI1wb2I9u0ZE8ppmMh4A6RacX9c/WepxNBOh5f2iXBmlRriGXn5IPI6NIE8d5FtGIJo4lkxJ9a2HddYJ/5kSBi92hMhGRKuMaJ4EOSJj8JTPFAWvQ7f26nZ4LYi6AU44SXJMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cDxc4cV+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cDxc4cV+"
Received: by smtp.kernel.org (Postfix)
	id D3B5CC4CEE2; Thu, 13 Feb 2025 14:47:30 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E8A50C4CED1
	for <tools@kernel.org>; Thu, 13 Feb 2025 14:47:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E8A50C4CED1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739458048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=RYuSXYma8k7548AIH+r25ugjbvnXtUAA+ahGIwSCjZI=;
	b=cDxc4cV+Wp1+y1gHQUZJIwIWHa2FCioGXkZuEF5/Zk0Zk2k+n2gkVmRsRM6YWmv5yoDNVe
	IfxyPYMyg+sa6WuCjTqCDBI64CK9Kz9JEz9BfmM6OLghX/MS7D173EL8MbFqqYET7cqtGz
	rXfl5hhh9GPuSqYKCuOjfzYc7uuB9xc=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-522-QsMjhklNMCKWF3F5xu-j9g-1; Thu,
 13 Feb 2025 09:47:25 -0500
X-MC-Unique: QsMjhklNMCKWF3F5xu-j9g-1
X-Mimecast-MFC-AGG-ID: QsMjhklNMCKWF3F5xu-j9g
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 540CC1800878;
	Thu, 13 Feb 2025 14:47:24 +0000 (UTC)
Received: from localhost (unknown [10.2.16.157])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C87A81800359;
	Thu, 13 Feb 2025 14:47:23 +0000 (UTC)
Date: Thu, 13 Feb 2025 09:47:22 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: tools@kernel.org
Cc: konstantin@linuxfoundation.org
Subject: Way to list pull requests with b4 or lore?
Message-ID: <20250213144722.GA522528@fedora>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Gv4JnfGgBgWrqXth"
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93


--Gv4JnfGgBgWrqXth
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,
I've been using b4 and lore.kernel.org more and more recently, they are
awesome! Is there a way to list pull requests from b4 or lore?

Thanks,
Stefan

--Gv4JnfGgBgWrqXth
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmeuBfoACgkQnKSrs4Gr
c8iFyggAlkFWaKKYlXEqk9P4PZSCnHIvE8XDx49mBTGpbwgqtPz5/1YsW8WBwzXI
ywPRjIsGbVZfgYBLWf63yuyej3A0/fQi7DZ2aiUDJuEfPZfQQ7sKVMNt9nrIIBKb
IrXKdHQVsmMPNfBzrJb3ov4zhNxveGEn3NyzHB5q0GOJX/zZuRd7CwmFcD6+dvpI
gpEtBZBz3IxWk3k7/38ogYOpbHUiTxrzTRbOWKXk/F5bP2ioNt9ZRKFvFWywf6JL
gO5j0ygVGoRs+dwK9o0XMMWuMMkXDGINqaqvuW2qKX46r2nkMq0cK1DwHPpEaETF
Uw+lEqdMjSitHNJ0eSuCH9FkHYcZTg==
=7Fxn
-----END PGP SIGNATURE-----

--Gv4JnfGgBgWrqXth--

