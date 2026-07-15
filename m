Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45103AE1AF
	for <tools@linux.kernel.org>; Wed, 15 Jul 2026 04:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784089397; cv=pass; b=OzBxa+kNfTgjw68AR27srN5xBU9+YUxIz59w4Q+jOAcsruZIs17gWz4A3aHKjt9WiElI6E0MVeWPthF41fQEHz3zCjYiGj1ZbclIqD9X26PPDC1BKhjKm1Dv9DzfzfZKNzE63XUOWQi9VCXY+Ob1sPs9SH04Itwm75t5tt3GSmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784089397; c=relaxed/simple;
	bh=8BmOWmmwPuqIGUQo3jJN3PREUOCrsDHVM0b0uoLoSkE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To; b=rAgOuBUBZSf59ZLnFS1qCWixvhbMUxORgHzw5e8qKCdmj04gh5AX/h+Lhg1nEXMRI+1nZ3IY1l0eBWtm6BDH4+19k8Td7l3tRKhwKm9pNErisY7gPHJTp4f0pLq0fu9CjSgksrL3mT9WQNlV0nOk+ANF5G3hTiFDFW4L0VzY/Vg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ukb7yinz; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ukb7yinz"
Received: by smtp.kernel.org (Postfix)
	id 3B7581F000E9; Wed, 15 Jul 2026 04:23:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1784089395;
	b=pWyYB4GpOH9fatC7/GHLe3yqmfvqRsfUxg1vF/6IvRFQTAQphju672RLRtoHCNmVQWFL
	 PfwxGZ68FeiINih6jawRBWHbtfFtolCs9w5p5PIHQLDKx7HtBTyK+TPFx+GyaguFigGQZ
	 m+j9BKMhPAH6DI0zbBAcHlTdxEojXVeiVVLuh1vk9eo0YNxqPfbNmcRQWtuGh8mqbx/M0
	 ONgxGw20J17zIQjHG3B9f7BPe8lGRxc1zQ4M6kdHVuCAyAVgGzPp29+ZG3tZpqC7T9Bgh
	 tI6K6XuCoaexdPaivnCyiC7JUefZpg+O3oHjVR0WHKn5WdK342Nqb78FGRdIsfbDbmQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1784089395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:From:
	 To:X-Mailer;
	bh=8BmOWmmwPuqIGUQo3jJN3PREUOCrsDHVM0b0uoLoSkE=;
	b=JQ6yus4LBnurHmtDWQprB5iKD2PeJkHKbkPpYXt0wQz77ixTaLXxmhY2gnjtvRWLtfHS
	 B3KWhD7Qm3lem5T4r5PdljSAWnxzgdrrL0o4+UHYJr54OztNDfSDlwuPl67/xVK/CAw0U
	 TfNskeV/CyvkN2VIwmjBrqQp+yrh5wfH+9OpdmBspcbyNjOlqkfvEt9ZVcp39UnsFMwXe
	 VRAT+mpuo4QsEnfBMBI3tAf8kQziLHfUofYU0vX6r3VO9VuRrL+Al1D3N4CZXedTIrQmE
	 /69CxLRwxD1YqXtIm0aJX4HsLCIVroGdhZzo3GkKs5C6pJBo2MuwI8sP/bRniizFfNw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ukb7yinz;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E7F2C1F00A3E
	for <tools@kernel.org>; Wed, 15 Jul 2026 04:23:13 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ukb7yinz
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org E7F2C1F00A3E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c9e30214d8fso3520720a12.3
        for <tools@kernel.org>; Tue, 14 Jul 2026 21:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784089393; x=1784694193; darn=kernel.org;
        h=to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8BmOWmmwPuqIGUQo3jJN3PREUOCrsDHVM0b0uoLoSkE=;
        b=Ukb7yinz6kMD5v4rJjJCVXTdyQ9Pchey4c50yOMpR1BU9OE5yb3BTvmqDvjg52Ak33
         wYFRSUsXPjo4NiGfRoDngQF8Z9A8ck/tT2G/8sXTqtq0Y8AHKFRggaAuLb2+hSg/Kg93
         zA6xm6ZkI+lJoISYMqGv2RETimibFnSka7vql7YVGuLmOhqIBKKWxTEOLzDYxfeFZoCj
         AVaHsK8Kz1sORWaH9zzFu5ybcb6VLGfD3Zu5Kx081Z95kCPKccOwIWxXX4DWQDyAyKk4
         Ux9msdxvu9EMU5gnmeezmAqaV+iotMohfRwiYYOGtxzriRpuUMdWhowJgrrMMXDHICzK
         zM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784089393; x=1784694193;
        h=to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8BmOWmmwPuqIGUQo3jJN3PREUOCrsDHVM0b0uoLoSkE=;
        b=RcpqAUjGJtEXi7zYUps2KWjh6FaGRarq1cU153A68Bo2praQ1RWNCVqeKiejW6L0Nl
         ZJAqnhc6to8gt+ypcxiSRj/GMxdaG1JGArFw16uY4TtFeVIOzf2/jfP+M+X3kjJIxEbn
         hYSeRB6iVUZpvxI+NSKAMPQNjEMNbbO1PqiZnVVwrFcd525NSX/Ip24iYdNH/1/3wl1p
         EjDx9yDj54TGB1g38DFDtvFHCQuKOP3J3byQy9qZ8chMuE9uzm6FIz4tvscJNse+ofvM
         61bIu/YcwAlbNsagojk1KivWNficcoWw3bAuz//dpjMNwQkNTEoA/MfSAH0vT9a+kjg4
         FqKA==
X-Gm-Message-State: AOJu0Yw6iz9+079TzC+4o2Xic27/KYCNEC9Ng3jeVB4IpfNCjSpI0/2y
	tAzOuPJAIYyBD5So6Jmgw1SuXgiMJVnq/7v1wuvtu1tLD4WHYkn5axePEARxg+2l
X-Gm-Gg: AfdE7cmWS4+yoAHeRSwm7YrepwhQ1L9dWujHlPyxbCXih95fJ9z8lbaFub9ywWOnX0T
	YGsWJeQWjKZQN33kI+VS9NTF1NO4ghCD6PkdDhzkzSuXjny1QXUiD6EGeGMNYlKFk3qfojUmnJN
	yuJaTVprwIJfRTMN2puir4w8v2930oq9LRHtobX/Hxglp8NBauk2E6kXSSoNgI6rICfYhA6DtAg
	3EV5UrT4a9b249XmCzit91ryZWe12IQBz3HWsJR6bEDFpSlnkHL8778DWVcncLWdMIjY1QHlpKA
	41I24Kpjy7kITFUM3rl5MPq2BZ1dAbfC1SzDq1HrXEdVI8OBXSUcneUfiI2+Mtc6z18W2UU8PJD
	AJ9DOU1MhoOTthtqMvgaiHrE5gOLCqwGyIJ/57vwEAWgwcL9oP8frsZwNDkwHfMSKlRzUQOlacb
	UZMqBt5FNUyo5hKw==
X-Received: by 2002:a05:6a21:3cca:b0:3c0:9c19:65bd with SMTP id adf61e73a8af0-3c36c4983b8mr1282673637.69.1784089393224;
        Tue, 14 Jul 2026 21:23:13 -0700 (PDT)
Received: from localhost ([98.35.8.117])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117483dec6sm87720342eec.11.2026.07.14.21.23.12
        for <tools@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 21:23:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Jul 2026 21:23:11 -0700
Message-Id: <DJYUWNNX1I22.2632DDSHKRPNQ@gmail.com>
Subject: b4: NixOS module
From: "Farid Zakaria" <farid.m.zakaria@gmail.com>
To: <tools@kernel.org>
X-Mailer: aerc 0.21.0

Hi everyone,

I have been using b4 for the last few days as a new contributor and it's
been a great experience so far.

It's definitely a full packed tool with lots of features but it's made
sending and rerolling patch series much easier.

I just tried the `b4 review tui` feature and that was pretty awesome
too. I did find it a but hard to see the inline Agent notes however.
I had to enter the "Reply mode" to see them rather than in the "View
mode" (these are the inline notes and not the high-level commit notes).

In any case, I run NixOS and I wanted to share my current NixOS module
for b4 in case anyone else is interested in using it that way.

I've upstreamed it to home-manager here [1] and you can see it in my
current NixOS configuration here [2].

If you have more suggestions or ideas on how I could improve the module
please let me know.

Thanks!

[1] https://github.com/nix-community/home-manager/pull/9658
[2] https://github.com/fzakaria/nix-home/blob/6f0e8ece2749db124e99fd7630cb9=
e8fc8b3ffaf/modules/home-manager/b4.nix
