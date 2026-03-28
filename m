Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE931285CAD
	for <tools@linux.kernel.org>; Sat, 28 Mar 2026 12:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774700321; cv=none; b=NZSzsfiJOKvpsQInQVN1wJe5w7EFcHgO0L7ZSXf8ojd04a4XnYUTMrYJor16hxgyHSrjpUlQZ8nmF50c8pi+Mu8HWShk1GoIbTNUWFx0HB93qd+U4l58gWMl1gCQUMUrGAGQ4DmRJbv/wrcZHmVWYtzfW2FOXj37TfuacwZsH5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774700321; c=relaxed/simple;
	bh=hbRyEHfJ2rR26pdMOU97BIERka/hsvVO1f7ecD9AP/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eWQzweTF3PenAuHTrv6PuYxGRtR7lWDAyyUfTX70vyX7KphSx2qgeKMr1DwJL4csZaClGO9UhRWP0Ys9AI5472qR7ouXbMbQPaZyyhDAdOiQqh8Y2KXa1mgxgGAIGdR1FFHfZZ4/mhhFysT3iQomMvFW9kniAhJx7mSDgVhc/7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 4E1C7C19424; Sat, 28 Mar 2026 12:18:41 +0000 (UTC)
Received: from csamuel.org (csamuel.org [74.50.50.137])
	by smtp.kernel.org (Postfix) with ESMTP id 52301C4CEF7
	for <tools@kernel.org>; Sat, 28 Mar 2026 12:18:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 52301C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=csamuel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=csamuel.org
Received: from localhost (localhost [127.0.0.1])
	by csamuel.org (Postfix) with ESMTP id 9C27A40A8F;
	Sat, 28 Mar 2026 05:18:31 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at csamuel.org
Received: from csamuel.org ([127.0.0.1])
	by localhost (csamuel.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2cWnNvoxe-x4; Sat, 28 Mar 2026 05:18:30 -0700 (PDT)
Received: from [IPV6:2601:41:200:4c40:8842:a874:ea9a:4cf9] (unknown [IPv6:2601:41:200:4c40:8842:a874:ea9a:4cf9])
	by csamuel.org (Postfix) with ESMTPSA;
	Sat, 28 Mar 2026 05:18:30 -0700 (PDT)
Message-ID: <4e728049-4b15-4f45-9cf2-f934bf249d4e@csamuel.org>
Date: Sat, 28 Mar 2026 08:18:29 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: b4 review experience
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org, Roman Gushchin <roman.gushchin@linux.dev>
References: <2c1ab8a2-8a86-48a7-9a53-ef3a00ab4bd2@csamuel.org>
 <20260324-skinny-daft-nautilus-167b65@meerkat>
 <2762cb7e-b277-4722-b6a9-da11c771783f@csamuel.org>
 <e1c2b0c9-1a9f-4a18-91e2-eec6f6f17170@csamuel.org>
 <20260327-benevolent-tungsten-chipmunk-5a5558@lemur>
Content-Language: en-AU
From: Chris Samuel <chris@csamuel.org>
In-Reply-To: <20260327-benevolent-tungsten-chipmunk-5a5558@lemur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/3/26 17:00, Konstantin Ryabitsev wrote:

> Yes, this is turning out to be a very common observation from people using
> textual. The solution is indeed either to run with --no-mouse, or in many
> terminal emulations text selection can be forced with "Shift".

Aha, thank you! I'm also trying out Cosmic on Pop-OS at the same time 
and with that it looks to be the control key that activates the ability 
to click on URLs.

Which leads me to my next discovery - I had found reviews on Sashiko by 
searching for the patch subject, and then found that I could copy text 
with --no-mouse but I'd not tried the URL presented. Now when I do use 
the URL I get an error from Firefox saying that the page couldn't be 
found and "curl" confirms that Sashiko is returning a 404 but with no text.

Eg

chris@pop-os:~$ curl https://sashiko.dev/patch/2191
chris@pop-os:~$ curl -I https://sashiko.dev/patch/2191
HTTP/2 404
date: Sat, 28 Mar 2026 12:11:00 GMT
via: 1.1 google
alt-svc: h3=":443"; ma=2592000,h3-29=":443"; ma=2592000

chris@pop-os:~$

Maybe that's a Sashiko problem though as I guess that URL coming back 
from your query to them for reviews?

I've copied in Roman Gushchin in case (and my apologies if that's not 
the appropriate way, I couldn't find an email address on the Sashiko 
site and so I found the announcement email on LWN instead).

All the best,
Chris
-- 
Chris Samuel  :  http://www.csamuel.org/  :  Philadelphia, PA, USA
