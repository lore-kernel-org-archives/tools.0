Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6EA6D1DB
	for <tools@linux.kernel.org>; Tue, 30 Jan 2024 14:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706623933; cv=none; b=uqCqeLTBzIq5eS768KO+r05xvKN7Zk8F6sHGMiCYldjNDvRFriEeKKIYK+viRqUDtzHFtM9uIzTGt8SW0VeY23sjH4U7YVbkIcdA1ldDQnIPwS+7X+VQbr1AAC8oxemSEm7JQbyjbxCBlhdn5q8J6RZq9pic4FOXpV+zh/tp+gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706623933; c=relaxed/simple;
	bh=Gp2whjsMsdTzVKV3c7zHPEJjktJQfdUH0ff82i5fGg0=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=UMXzNWu28cdifStkqPQncpdWkZ1CuaB2UOBB77s18/8XOKXMExVoJhDnqHqpOQbsE83Pll9naloMl+5QYdQi1sf4CZ49g7rfdvkB6sRDbGKau1K6za0XxiRHlNguNFwTgWYfvsl0s9qV69rOHeGhFoVnvTb58AKYHct6Nm+EGOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arinc9.com header.i=@arinc9.com header.b=JW7zhJ3u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arinc9.com header.i=@arinc9.com header.b="JW7zhJ3u"
Received: by smtp.kernel.org (Postfix)
	id 80805C43390; Tue, 30 Jan 2024 14:12:12 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A6423C433C7
	for <tools@kernel.org>; Tue, 30 Jan 2024 14:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A6423C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arinc9.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arinc9.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CC65B40005;
	Tue, 30 Jan 2024 14:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1706623922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Gp2whjsMsdTzVKV3c7zHPEJjktJQfdUH0ff82i5fGg0=;
	b=JW7zhJ3u2j4qvuIO0wUWqpcUrLAhXTKVJBidZYCm5SwW5VaVUWmQPJRkSRTUZcXsid69Tu
	ThrwdGtil3IWEmpxfnRvaRwaMoNB2t+5pshV+lFDdqxEPY/F0GXJaZaTpRghD8uU3Kgc4q
	d0AndvWkNWgl7vvKG6HKdCAv/xCIsWB9QN6tV1gwpAShjogOvDplOnVirJLCarE50KPCJX
	A8/PfC6R5AZdJefRFBI2syUSGFPus8xPVSnrXrQmz6FhFyFrHGAY+zU0TcS8Vdnsl6gERN
	T7ZWxu8dsWHYCVoFfxwUQjrfz+OwqCvRdcYVp1Ykj8skQ/lbl1se+tdy5nJpyw==
Message-ID: <18021e23-8f6f-4cc8-a331-64f490b47424@arinc9.com>
Date: Tue, 30 Jan 2024 17:12:00 +0300
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: tools@kernel.org
Cc: Vladimir Oltean <olteanv@gmail.com>,
 Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 =?UTF-8?Q?Alvin_=C5=A0ipraga?= <ALSI@bang-olufsen.dk>,
 Linus Walleij <linus.walleij@linaro.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: b4 won't add trailers in chronological order
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com

Hello.

I see that with "b4 trailers -u" and "b4 am", trailers are not added in
chronological order. I've seen a fair amount of discussions [1] arguing
which is the correct approach, moving the author's sign-off to the end or
stick to the chronological order the trailers are submitted. Could we agree
on one?

[1] https://lore.kernel.org/netdev/CAJq09z4UH_jvva871_K+9ZgahDQp8Bv101EHcYJyrQK7xkOjJg@mail.gmail.com/

Arınç
