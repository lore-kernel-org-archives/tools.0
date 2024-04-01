Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15208BF0
	for <tools@linux.kernel.org>; Mon,  1 Apr 2024 14:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711980185; cv=none; b=OO41XdLSOc5eC65ubMSarRkQ419b4rRFNDOEWfMTOOzDPSJRhSRpo1YGKzx9M1JgLDN/ijzuFVaUpFuVrsKVPJLdH5zLkw6n2PdABi7tIbIw1kCbxmqL6YEqQWbp7lPV6BelEkkPlb2AYWvMGFjlMcqfk7EcX446hR7Zggr4IHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711980185; c=relaxed/simple;
	bh=6m5KDwCX2L0x5ygANd/5c6bfwNs7tc4ek1XQeY1VqGg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UrWe6Ti+nXzqBSfMBrmbm2VfWeZgsrowcqVDGur51ZjjzXArzTno7a35k97+3WlG2YQkn4i0I2WIQJGcduZjlF/Cn+ZGXRgCVp0uUYyBN1mq6RkbsHB2yviEJULWxKzt1J6czjOHGcvKKrdFBVej9hZI2IuuktzP3mSafa89mzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.b=PHHwB9cL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.b="PHHwB9cL"
Received: by smtp.kernel.org (Postfix)
	id 5773AC433F1; Mon,  1 Apr 2024 14:03:05 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7FC2CC433C7
	for <tools@kernel.org>; Mon,  1 Apr 2024 14:03:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7FC2CC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1711980181; x=1712584981; i=j.neuschaefer@gmx.net;
	bh=6m5KDwCX2L0x5ygANd/5c6bfwNs7tc4ek1XQeY1VqGg=;
	h=X-UI-Sender-Class:Date:From:To:Subject;
	b=PHHwB9cLhLA9boJimKyEL/gX258R3dMNLLtmUiY0OjdxBSgIK20qxFutG+TsR74V
	 dahfdeulpiMAxIv0xd0/qUlLGn/eUG2XeuwPV/tFJRzMbqt4XgfElmZ6S2iIwVuK2
	 1wPa5VcDPFdiZz4ba8o/vxMG3u7fpPDuZb1mKXmhS/T8McxygcS1n5+5DrOxKPd5/
	 Vr0j5wzZdx8Cq47sPGFyEL4RydKFhnfiU2b2Ci61WutfvKXCaJKn9DHr+NNe1lCmQ
	 BYekqNI5Z6I8A55yiQfWtqetvSeIWw1QhgQH0p98DSgspN+8FGZwN+z6hDtxlzye+
	 dGdtfvPOxl9bhJbAGg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([5.145.135.152]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MIx3I-1s6CVT0qZ0-00KRL2 for
 <tools@kernel.org>; Mon, 01 Apr 2024 16:03:01 +0200
Date: Mon, 1 Apr 2024 16:03:00 +0200
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: tools@kernel.org
Subject: "b4 send" does not respect sendemail.smtpserveroption
Message-ID: <Zgq-lE2PqA7pdgid@probook>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4bLN11L1dx51hxiP"
Content-Disposition: inline
X-Provags-ID: V03:K1:TkyFiwtMRbYHU3m95DY7bnQPKDppBe1VbMYCZ4uFcp36xFgmu01
 An/CkwMldlM0V9zE0UUAeiYHLg4x71ZokaRZKUiUopeykvMsvuMmzAYlactF6OrXIbhQ/5m
 A4K9tb/EPnR7gQBfaliEWlBCIAnXAiA1gK4gcYZMqZN3OaocvRWCyd0Bm33kcCycfhFtFy1
 RJFTLCBiXmctOWTDRFUpA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6SNZChYb/Bc=;iksX8gcqvVUdnmy83N8H4Z8jQkC
 hBjOzscmhz81UovcurCNbEEIohIYjKeiD0fog1RyEw7qM6uoFln2Wt05tpTUsX7yzhOsbCnEI
 704pnvrifEr1lwCrfNUv8r7AKozihee6Cm1g+Qv8uWnSBK7fg1THqSVAgdwE1+66gi3hoeBy5
 3ohaVFmgwLegqvjy4rR2YL5ntnSelkht6q0oIBzuVG5kJLzwVGwJynaFgbRfIhpB8d4Vu/ye6
 T6ODtCgKqXHcmS+oCY5PTIJg5x/30P72nAp2XPqv3FgHya7nNXfVVScQPZRihuSfzKrI1wfwC
 QT8lqXIoEmhGOIfTnYiC9AfDw11FQKg2GcdW9h2wY4yNy6GziWL4excyB+6Ob044+Lv/Xa470
 kMI2bwY7ZJfLbA72AlZE8It9VHadYtE5OhE2oXC/VviQIZu+AGRAPVkdyrtQH2Wen8uGAc+AC
 88sXsm6JMbb8MJnKmGmURcN/CD0Z/xwJEFVLs1LfJFGiw18r9WkFLqSAZyuNV8dq+4jmKokRB
 ZiFChP8I9xaeSMki7WYOP6gOZxNLmpGT9APXDbxL2C2mNhJNEBMqB3QGnKfrj9ZiEbbbc3kBo
 e8A7re1a89NofxQjwedmQiU6JuRAiDlDpO9RMHlIWZKIbcoOOu5F7mndzdFk5Hk1KWLG9hyug
 lERNqRn1iRjr78HQG6mfKKTugnPYhHwHHVAR02FSH9Ny0SbRoT3caAJ3cmqJvNDl23Bt9p7FR
 J82x/QLYwqlVCD575STNeWLGo6VocZU5Ot+3Q27o6w7V6fJZbHWfYXMogm2NVtgF5hTXiJ0S8
 Wh6O450/i8gQqKRLxajR9bHK6BS+jqijClk7eYSFnZ5VHFhRNW9BZZ9fFyRbjFlnAF


--4bLN11L1dx51hxiP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

first of all thanks for writing/maintaining B4!

I noticed that "b4 send", when using a sendmail-like MTA, doesn't add
the options specified in sendemail.smtpServerOption to the command line,
resulting in different behavior between "git send-email" and "b4 send"
in some configurations.


best regards,
jn

--4bLN11L1dx51hxiP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmYKvnQACgkQCDBEmo7z
X9vUpw//cU7P25//H6tSbrbSu0QD87OZedx/gQ2z/lx96d3oSOhyz21xW67G3LxF
2SPg0uDIsP3YM1lOVjoTkXygbxSUWSsKXJqjjn4dLh1SC4kYh4SqYKsdAgDnypO7
Ni23tmoQ62+8Y8XgoeDd2bSNQq1QX/YJu0dRCXl09fyqTJNITHdltbfIKu+FdX3Y
DuHcd0Tjo1XuIGD8N/l2iHuhZOlJHtvLE8/sihIceJhGyQOzDetg6bn6j4hN8IUe
dSE5bKhhhFdzXsXox0kr8PpqceVlccOLW70gjtzqgCCQYs36Pz9CJPl5tSMwIKwn
R9UjdT0rrrWylr9fK6cp17m8LRSIKFyQLDWoDNSSFN9WoE8NJQtWGNa5Y8URzR3L
pHlSDYbskkow82rwbnmh9x4GD+Blbd9lobWeraVrflH17698Rylies9yPXDklbau
17vxpOG2yXjwOjeoCOrR6QZ8GnlRHzgfdo2Z/t1kx3N1meT55hoeY2+Yk0WRhXLg
9Fb0lN6mDMjeInf7i6mwFHaI2bc2hhd2K/1Hd5N0L3ZTfZZ37qC1Hc2LluovI8u8
shxk41dFpXWxoUp/p65OOZQB9oXqYGRkWeYcO/lssdWWh74WOCOkDedU28uGOF8/
1+gP6cId62NsM34u94Wft6jAjJX9WnVtYu5GWVR6T85v3/xGvww=
=4GvB
-----END PGP SIGNATURE-----

--4bLN11L1dx51hxiP--
