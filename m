Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9422C3244
	for <tools@linux.kernel.org>; Wed, 20 May 2026 20:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779309377; cv=pass; b=Zm08/y7urcuwX2i9i6Ct4rCSvgJvq6cMyNU/B6wsNl+kVE+c4UmrYJ/7neKuC9wkah6p1szS5BtONdWe/6DlhdoLyLV26LoGTsnyR2eejd4koYni/vXCxVG2IKpRuekPQ0ESMpKcosH6B6QZUPubXkq0mvBFIB1qgasIHxt9MN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779309377; c=relaxed/simple;
	bh=M67sBLeNBapKRa2LlcfpSAzhmf6H0z9BJcdZ9BczllE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JbX3iF0N/npAdfOx10V2Htr+6yEBx2kAyiGaVrvc6vG5wzbKANaGi/0MyyF8erpSe0rYgSQJlOJCOcSP3DvXZkxfejf1bMk4De82Me0Px1Gn8wwA+ZQ9ELFTGWaLaY9CJnYzO7YEHQCfqpCFyaMfqSayAGP5poiBj1jVc5oi2Bo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=YEIrxkzh; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="YEIrxkzh"
Received: by smtp.kernel.org (Postfix)
	id 581061F00A39; Wed, 20 May 2026 20:36:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1779309374;
	b=wPxnOD57Gg+gM62s1got5u49p//cJ4mJR83MpBrPBikIjgOKKrssyFtUXwC+Zpk0pptr
	 +9sqBmIhA6JhnzUX7TaSpnZ8kUB7otMeS0wyJOcZSyqxBH0AWBCzj2loxm9LD1cpuoIKO
	 cZJs4Z1c6E6wg7l8bYV0/9zGdaFVeteXykx9/WRmIeqI0rXizRQws6jpBD6DAEzANPZyw
	 qCOD6GTouLc4xXctrOKjpS1X/6umxz3GbfpSZ4bBMLK4/Tc/oQIb0sSIsQEoUxyjWbH9P
	 VOXHds+l/1BVltSMJtoDDMSPiH5zrDiTC6v8HG4Ab25AGxYD+lMy3+pSfBzRtWhEHzA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1779309374;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=sGZRakQQYPWCO3UEB/fS2WDxsywGMvFDo0X1q1qlu2o=;
	b=slnfc0VyxvPqEQazz18Pv6L3zYn004zOfhXV+K+6yP7Ui75uw2romZMDsubZuqy3TSRf
	 EFRbs2EjLLm/MjnBBjxE1zyKMa0rOJNs+cUD6CPu2xnxGWHQE672A2Vjqf+lN8GWA8TMC
	 PspyWyy8gItvFQJU5TJ18yzhZSAMq899Qv6z+rmwTJo/BrPxk+kcjCmmS2BOvYqs/tB1N
	 iihEAJK06kSWqd/cmJGVA/Ktk/1Tid9OX91wC9/OswTNjNu4w3YisXiBZl2yoMySGEBmn
	 LbQlL5kL4CvLhSKXZj3OvqwTzjQbHd3SYHlAfSc7/QRm2pzTM/ND3F6LZayzqJgNKtg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=YEIrxkzh;
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1A7C91F000E9
	for <tools@kernel.org>; Wed, 20 May 2026 20:36:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=YEIrxkzh
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 1A7C91F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id BDFEE40E01A1;
	Wed, 20 May 2026 20:36:09 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 7aGXdGm4ahUl; Wed, 20 May 2026 20:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1779309359; bh=sGZRakQQYPWCO3UEB/fS2WDxsywGMvFDo0X1q1qlu2o=;
	h=Date:From:To:Subject:From;
	b=YEIrxkzhWNURBkOYYKK2Jn/cK2Ah1p3bKk8MXIwGSWk9oke5nIeXJU+daNNIUd2TU
	 fpDZ/outUcjNendeXGAEsZR+IUYIY1qReyNWGjufZCSJkz7LXwLXPnbor9wVzOMOMP
	 Qhbr029yqCHzOgn0iSEfs0taik/D4ZA5kC0hq+wpt/kkAyY5AMwrP+KBiQj9YFUNik
	 vvx1wk6HH7A2lquMWWm6lpojWM/wxaPFLLKE6ZsFQGRdNc82fW7eCJ0R3AEtEdYG8n
	 pIYK9ms6Htr7G6xd2F5M2nhaDtPQpQH5lYx/4ra68A+2l55/2nwrr9GYWrKeuW+JBz
	 6f8wn/0fCKez4hWD5uZaevayXNGDqMc5eDxgCIguMEnT8xV2ogib7mrt233P6gZJpM
	 FGHZc5Hfv19eijBT8Hv/Zha/9EmxIyOTZK6w4qYKLq4Ciq8cPc2BoAZfo2d/Cac7NU
	 9CU4T6FRdbSJYlISxDW2CrJL6oMsD4ci1HJ7Z1NLxqObaggFeiw7snqW0SLWV3BYF8
	 8KgIZG2C3RDkFERxEuEzAGgxfC6tt5pwB2HQbeSws0SOZpoFpFCpV3NR4ldJtvLnR0
	 mKwM62w8v3WRUERH2kbdvDqTip4+oS8DY/akNfNfPiEezzv+Y64hrKFnGDk1ztggne
	 T3D+kZCJ5pwLLcC415W8uRDo=
Received: from stx.tnic (unknown [165.204.154.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5383740E0032;
	Wed, 20 May 2026 20:35:58 +0000 (UTC)
Date: Wed, 20 May 2026 13:35:44 -0700
From: Borislav Petkov <bp@alien8.de>
To: tools@kernel.org
Subject: kgl and git shallow issue
Message-ID: <20260520203544.GAag4bILhFL9wSQpxY@fat_crate.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi,

as discussed on IRC:

$ kgl pull
Updating feeds  [------------------------------------]  0/1  https://lore.kernel.org/lkmlwarning: Failed to update lkml: Git fetch failed (exit 128): fatal: error processing shallow info: 4
Updating feeds  [####################################]  1/1                              
Pull complete with no updates.

because the repo has been fetched from longer than 1w ago.

Raising the --since does the proper thing:

git --git-dir /home/boris/.local/share/korgalore/lkml/git/18.git fetch origin --shallow-since=1.month.ago --update-shallow
remote: Enumerating objects: 66197, done.
remote: Counting objects: 100% (66197/66197), done.
remote: Compressing objects: 100% (42640/42640), done.
remote: Total 66195 (delta 1533), reused 66029 (delta 1490), pack-reused 0 (from 0)
Receiving objects: 100% (66195/66195), 107.70 MiB | 741.00 KiB/s, done.
Resolving deltas: 100% (1533/1533), done.
From https://lore.kernel.org/lkml/git/18
 + 971bb3a5d326...4cfd85f2eacf master     -> master  (forced update)

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
