Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795161509;
	b=FebXazg5BZ9295bosldrTTPWKch+M0UbUaGPLA2HRv5ywa3v4Ovx72CrPAlt7RDTJXaz
	 6KekVCKin1sfKmRr5+RbRDFGD8PGKvMm5SV7hCt/r3BSTtYzXyPd3WnRCM2yhZ7cPunYE
	 YraRGYPfd3U0EvGQPGUJN1YfrFdBMSxy5ZD6UOad9YhtJr/oSg65GdEPnBVHQuy+BQIGe
	 RXhje8J/IfVv4Dvc0kd5yEUyV3DhWGeKXlJGMV5wJQMU62Mffvu2WyIQUJb27xJckxNaq
	 s8eTqT2gW2jqPx+lmEOGiAVOt6qEDMMjSm+hvRKc69/JXboaNTceKJc5axF5EAGG9GQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795161509;
	h=Received:Delivered-To:Received:DMARC-Filter:Subject:From:To:Cc:
	 Reply-To:Content-Type:Content-Transfer-Encoding:MIME-Version:
	 Precedence:Received:Errors-To:X-Complaints-To:Feedback-ID:
	 List-Unsubscribe:List-Unsubscribe-Post:Message-Id:DKIM-Signature:
	 DKIM-Signature:Date;
	bh=luEnvHZPBNghr/JEkvBH+rF7jk+FRbhnaW/z1FHV2ZY=;
	b=4yqvN7IJIKRPWt4C+XZX2M/cBSy/fLflda01E1NsLrxhR3R8By5IWJwLD1CB5fW3sPqi
	 8mVgvn7Vy+SJQaWukT6yU5WkaLADYnIkcExu0czcEFlysHP0QuzsSrEbPH899/KQc+Zyf
	 SZ/hCXoPloAbDapnHvOp04MRSsoqqOpcKc208V9u5+ZzkErYAgjlkvqfAo2X8W6Zki6v5
	 8uq1jlbwFZhcNZH8NNPMxiBUMFGyTns/sr6/l4FhxO0O0h3JF0opg5BFkSSCj37LMqQuY
	 HVeXJPImbXYktuHhLGdAcRleDQaZJynEPdmN+MrJoOnVI/8KP4qoFFqO2IcAFP3vQxA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=smtp-pulse.com header.i=@smtp-pulse.com header.a=rsa-sha256 header.s=smtpsign header.b=Jxq630sM;
	dkim=pass header.d=wahimold.de header.i=@wahimold.de header.a=rsa-sha256 header.s=sign header.b="i+XMzA0/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id D23DC606A320
	for <tools@linux.kernel.org>; Fri, 20 Nov 2026 07:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=smtp-pulse.com header.i=@smtp-pulse.com header.a=rsa-sha256 header.s=smtpsign header.b=Jxq630sM;
	dkim=pass (1024-bit key, unprotected) header.d=wahimold.de header.i=@wahimold.de header.a=rsa-sha256 header.s=sign header.b=i+XMzA0/
Received: by smtp.kernel.org (Postfix)
	id 8D6551F000D1; Fri, 20 Nov 2026 07:58:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=213.109.76.189
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795161508;
	b=nA2ZlUGdvjCX7g/VrmTf/+qDQy3JyCJW4xUrTzDSFYSv80eUYQYB3rCfRD4LMuJvTVH+
	 W9+STZm0yKACNnR1bVx6JeFLp9hSFT89KJ9p+LQcfwmZvZI5A81pg1cyccof033TIZwv5
	 0hhJ57Aqbd7qtUBAuI9+/gZY2UUrEemjTD41v46W5zHx9JSHbTWXuoaejn/P4654hggq/
	 vmi8flKrKHZEqz2PyCGBKbNEhIMuHZf39FVT+Wr7tPD/g2apyg6v+egKqEwCrX8J03NTR
	 nnEMLE+Tu3bfloXOJ8/zsILbSEqLLQGdljTZFl4ZVXO3r1CqZT0zeT0r2H9JSenj+WA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795161508;
	h=DMARC-Filter:Subject:From:To:Cc:Reply-To:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:Precedence:Received:Errors-To:
	 X-Complaints-To:Feedback-ID:List-Unsubscribe:List-Unsubscribe-Post:
	 Message-Id:DKIM-Signature:DKIM-Signature:Date;
	bh=luEnvHZPBNghr/JEkvBH+rF7jk+FRbhnaW/z1FHV2ZY=;
	b=WcdGne8JXk0LNHyIiXG52U8MKrBGgvoVb4lmJ/QttDanfOKmSwwNSRJhJyh1wwCwm6lr
	 6Rh0I2tMcXD7mTt9GvKmj5sKpsFNDeP6B79P8zC7iLyhC/EOJA2/PFnPyBzUJgknoQVmC
	 TjAakrl222ZqPY3TNCSJhPo2BvDpdMXIWtgFpHWbYai2V9XobZYQPWbIiKSCenlqbl/ra
	 i0QkyKTZleXBVKr6gMxIGgZppFVKbrRd5UTJCn9IaQsR8yLmfPbHcqYp5ALKsPuuqxFWa
	 Ngvp1Fn7HMadNyj3ej5aDxaKHr/FGKU6I9cb2u6vY0O/iHEjI1Ns2pBh6XWMKerm4qg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=smtp-pulse.com header.i=@smtp-pulse.com header.a=rsa-sha256 header.s=smtpsign header.b=Jxq630sM;
	dkim=pass header.d=wahimold.de header.i=@wahimold.de header.a=rsa-sha256 header.s=sign header.b="i+XMzA0/";
	dmarc=pass header.from=wahimold.de;
	spf=pass smtp.mailfrom=wahimold.de;
	arc=none smtp.remote-ip=213.109.76.189
Received: from mx28.smtppulse.com (mx28.smtppulse.com [213.109.76.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with UTF8SMTPS id 6C0201F000C6
	for <tools@kernel.org>; Fri, 20 Nov 2026 07:58:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=smtp-pulse.com header.i=@smtp-pulse.com header.a=rsa-sha256 header.s=smtpsign header.b=Jxq630sM;
	dkim=pass (1024-bit key, unprotected) header.d=wahimold.de header.i=@wahimold.de header.a=rsa-sha256 header.s=sign header.b=i+XMzA0/
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 6C0201F000C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=wahimold.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=wahimold.de
Subject: CNC machining and molding support
From: Max Huang <max@wahimold.de>
To: 3-work-pidfd-fixes-v1-0-a123b6ed6716@kernel.org
Cc: k-pidfd-fixes-v1-0-a123b6ed6716@kernel.org, tools@kernel.org
Reply-To: max@wahimold.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Precedence: bulk
Received: from username [14.155.95.234] (Authenticated sender:
 max@wahimold.de) by smtp-pulse.com (Exim); Fri,20 Nov 2026 07:58:19
Errors-To: postmaster@smtp-pulse.com
X-Complaints-To: abuse@smtp-pulse.com
Feedback-ID: 9495452:smtp:SPulse
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Message-Id: <tosjh8-0hufcl-om@smtp-pulse.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=smtp-pulse.com; 
 i=@smtp-pulse.com; q=dns/txt; s=smtpsign; t=1795161499; 
 x=1795197499; h=subject : from : to : message-id : cc : 
 list-unsubscribe : list-unsubscribe-post; 
 bh=luEnvHZPBNghr/JEkvBH+rF7jk+FRbhnaW/z1FHV2ZY=; 
 b=Jxq630sMkREsNx8vfVGaAbbbStnxwkrCM1lcS4ow/CyaF2F8nc7J7d/Z
 yAj0TFaNBSE5WW3oS/rCi0G1MzbPra/mu4QRVIaO/f/ptylkGzO7xKc2Dh
 11cTBb3uU9alXUeis3gwHmLWnW+KONj2iQOIss44IGDnbCfIV5flJQdqE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wahimold.de; 
 i=@wahimold.de; q=dns/txt; s=sign; t=1795161499; 
 x=1795197499; h=subject : from : to : message-id : cc : 
 list-unsubscribe : list-unsubscribe-post; 
 bh=luEnvHZPBNghr/JEkvBH+rF7jk+FRbhnaW/z1FHV2ZY=; 
 b=i+XMzA0/At7vDSk2AHBp89t9ax7fbPffZJP+4nR/ET7ALvCKLPZ8+K8E
 5rKxPnQbM2AVbH5xWpjbt0UbKWJbB3sV2pGXL7ymCeeJthvrOJAuzU9U0Y
 8+HGO0yiZ19shhB27CV25hpAl2gDU1C/mfft3bFigDTZUxUADGMYdtlcA=
Date: Fri, 20 Nov 2026 07:58:27 +0000 (UTC)

Dear Linux kernel team,

Wahi provides CNC machining, injection molding, and prototype production. Cou=
ld these services support any hardware-related projects or component needs co=
nnected with your work?

Are you looking for a new manufacturing partner?

HONG KONG WAHI PLASTIC INDUSTRIAL CO., LIMITED
Max Huang | Business Manager
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81
=E2=98=8E +86 755 21017247
=F0=9F=8C=90 www.wahimold.com
=E2=9C=89 max@wahimold.com=20
Silicon Valley Building, Yunfeng Road, Dalang Street,
Longhua District, Shenzhen, Guangdong Province, China 518109
