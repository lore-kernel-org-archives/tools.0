Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793594996;
	b=bjDyksxiMIddh+xmBmuvqoxQXuRk3pZ/3HUvqh+gwccuY9inHHLrq6qXw1hkbU9HAVfj
	 PBbEMHKByeJsbVqT4KgbgP9PNspRblqspiICZ1f/Ai7v8IXiZtTL4U5cziEQQiOLY55Cg
	 fI7VeuAOO4RXHb93BfM7/b7MxoupB9xxwzF+HeQjq49a2gqc7DzHWiCkQemc+UF7QmaAG
	 D6/PAikCFcb7JNPEHGp/oxfpc27hOZxrGU6k6gtBDd8d3aPee4BavXI8AHiXe8SJa0TRB
	 HT8P2WuKUdzf5PChr+IjLVqnRcqnAOemi8kGturI57gPS369PYqHCwJWW0LOKFlg59g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793594996;
	h=Received:Delivered-To:Received:DMARC-Filter:DKIM-Signature:
	 DKIM-Signature:From:To:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:Date:Feedback-ID:X-SES-Outgoing;
	bh=yrloVf2Wg2u1zsnTtuKaV0OAULFddWjZxICNVk8CXDU=;
	b=Iimiii1F+9Va1jVaK/WjYelsJLVFYPfZA+Xbjyt2wg8mVJZl8dB7etxV8Ubd09IXMfiz
	 UkblXxc58glvHN6+ET1KlZ4hjLNDTprb/SozM0WlvG+0/zyB/R8v4rTAECThCqU/BSspf
	 57UJqP1PxB/OndjVDPTRhJUC1o4tcUNoDe4nFymuoi0h/v2XVkYSG8Q222Jb1wTtDrwYb
	 dZ+2haB5FeWw5igQg118UZfqFVoRJ2LikrAEX0mVjfGtDgwCslDi5Ew6sKUFyQyqoju45
	 +VyYKzi47wCEKvp1jeFN+jW8Dn+vWCV27i8JF7C+YHr2DlNooIRQq0wGHKcCLZUfo4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=claveprep.com header.i=@claveprep.com header.a=rsa-sha256 header.s=6ohuwtltwzyfgohqnu2v4u7h24opqzz6 header.b=1mUWMR6E;
	dkim=pass header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=rlntogby6xsxlfnvyxwnvvhttakdsqto header.b=U5MsSq8c;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D91606A326
	for <tools@linux.kernel.org>; Mon,  2 Nov 2026 04:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=claveprep.com header.i=@claveprep.com header.a=rsa-sha256 header.s=6ohuwtltwzyfgohqnu2v4u7h24opqzz6 header.b=1mUWMR6E;
	dkim=pass (1024-bit key, unprotected) header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=rlntogby6xsxlfnvyxwnvvhttakdsqto header.b=U5MsSq8c
Received: by smtp.kernel.org (Postfix)
	id 18FEC1F00A16; Mon,  2 Nov 2026 04:49:56 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=76.223.180.15
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793594996;
	b=FH6kfKD7q85kF+QsjPTe1s0OX77BGnYGw3jDLAzzOj8Pl2Gg3uLWnJatgc2ODcUkV9yD
	 qPBNAjHHDmG5EDNFZSJJm0w+eVIphwnXl+N984yuSj7DufiyzouBBsv4Kj+mCEi3nXgfU
	 QwGDSNiO5XzKdowxTr7nwEl0hVKwWVjo5yOIEp4cj6xrGnvYT7h7Je4tie/H2/nMu8AlP
	 K9H1P4j6LXpqzGajZyJT3R58VM6Xen2KPzZKIiKXz2z8UxQvapm0mUV/OKgZCZyNvl4IV
	 fLcDhqHRZy5qBIDL2Sjx5iUC8OBv7CvH32ObYczEk8xQZcZrSX4itsG1aAOBxGeie+Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793594996;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:To:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date:
	 Feedback-ID:X-SES-Outgoing;
	bh=yrloVf2Wg2u1zsnTtuKaV0OAULFddWjZxICNVk8CXDU=;
	b=jyv7K+S2ytQ2lUbl5qAJpckQk5W0hGy6jHPkJfcrZEypyH96HuLwE9HZOz9rir+TXKkz
	 iaz6jWjAMSKWG5DeYrKJjNOn9A7/nM2cOzNnj+s/+9GTOcbRP/HxDDTuVhvvuK514riea
	 S9qDsUmKK1Qmopz6b8sITlrpK8KwqHCzoXG6Du2jtgOSWY5hx35LYXmc/WVKkyG68IGrm
	 3x7W2zJlFq3pK3r9fvDZlwU7xT6OtDX1Ww9lrhg1DTOinfW51ZR39tNBcusCDW9AAM+Dz
	 z/zJcci38nfC/oRWKmnCtGdq1lj0en7rSVH/H8e66DalORr9bOSoNkQKLkPop8iawiw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=claveprep.com header.i=@claveprep.com header.a=rsa-sha256 header.s=6ohuwtltwzyfgohqnu2v4u7h24opqzz6 header.b=1mUWMR6E;
	dkim=pass header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=rlntogby6xsxlfnvyxwnvvhttakdsqto header.b=U5MsSq8c;
	dmarc=pass header.from=claveprep.com;
	spf=pass smtp.mailfrom=a1.claveprep.com;
	arc=none smtp.remote-ip=76.223.180.15
Received: from c180-15.smtp-out.ap-south-1.amazonses.com (c180-15.smtp-out.ap-south-1.amazonses.com [76.223.180.15])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E43481F0093A
	for <tools@kernel.org>; Mon,  2 Nov 2026 04:49:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=claveprep.com header.i=@claveprep.com header.a=rsa-sha256 header.s=6ohuwtltwzyfgohqnu2v4u7h24opqzz6 header.b=1mUWMR6E;
	dkim=pass (1024-bit key, unprotected) header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=rlntogby6xsxlfnvyxwnvvhttakdsqto header.b=U5MsSq8c
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org E43481F0093A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=claveprep.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=a1.claveprep.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=6ohuwtltwzyfgohqnu2v4u7h24opqzz6; d=claveprep.com; t=1793594992;
	h=From:To:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date;
	bh=yrloVf2Wg2u1zsnTtuKaV0OAULFddWjZxICNVk8CXDU=;
	b=1mUWMR6E1qpKRgmL3+rAKpTgUxYtZM23ANi6hqTWSPPUO64Kk7Wle5VoBASTdICe
	6vrk8FbBGQJW5VamO+8AABztqVqQ0ebcOe+dlh/FeJ1rq4KQAHmGw+WgVmZjQkEKm82
	6POh8laLaxLoaAxbov4653P3SvJ0MVlcIcTTLuaUWLWoEjLBdQweYGbsGK7sv42+V1V
	cTl72pzayyZTrYQgFY19KLMnO7KuhFxV9UZERJFcKx/5fljtYvgHeQeaiu0XC+DZw7Q
	IXwVC8vEf2pmCnoPofMADLY78mfqbx1xdJD9cchj1/P0bU8AWbNemaOLiALO2eiDleN
	4HGLcM8HhA==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rlntogby6xsxlfnvyxwnvvhttakdsqto; d=amazonses.com; t=1793594992;
	h=From:To:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date:Feedback-ID;
	bh=yrloVf2Wg2u1zsnTtuKaV0OAULFddWjZxICNVk8CXDU=;
	b=U5MsSq8c2ol+wd57BsHstRoULe33vCRmUn2JGxuq8ACW+KBr9HOG7mlHSiJgZnCX
	zIp+Clg3IVGxMrnuFgPCJLnVd5vJ7eM8fJ6Lb3stVT6zrViYdbfO0wlV1Q10uLBvEYQ
	iXT7AqGcRCpbRudEgDwr0b2Pin9RKguQiRfm850c=
From: Clave AI <contact@claveprep.com>
To: tools@kernel.org
Subject: Practice interviews built from job descriptions
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID: <010901a19a97a779-c3d02fb3-d9d8-44f2-902f-6c07e11325e2-000000@ap-south-1.amazonses.com>
Date: Mon, 2 Nov 2026 04:49:52 +0000
Feedback-ID: ::1.ap-south-1.8Atk+svbcKJTuJIedclVTSOIyvsx+AWPIh/q3FIlq6E=:AmazonSES
X-SES-Outgoing: 2026.11.02-76.223.180.15

Hi there,

Saw you're open to new roles, so here's a tool to help practice for your interviews: https://www.claveprep.com/app

Rehearsing answers in your head usually feels fine until you're sitting in the actual interview trying to say them out loud. The words just don't flow the same way.

We built ClavePrep to make that part easier. You save a job posting you're applying for, and it generates interview questions tailored to that exact role. Then you can practice answering out loud with an AI interviewer and get clear feedback on what landed well and where to improve.

If that sounds useful, you can take a look here: https://www.claveprep.com/app

Either way, good luck with your search. Looking for a new role takes a lot of energy, and we're rooting for you.

Best,
The ClavePrep Team
https://www.claveprep.com
