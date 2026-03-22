Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B816A1E9919
	for <tools@linux.kernel.org>; Sun, 22 Mar 2026 02:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774145506; cv=none; b=gUJqnHXrYq3Hq2ugIREcqG/xC8q9J48nD3hZ956KOj2QPUUN6dMSFC5al3UWZuoZu06fP4icCMt/ncOC8w+2hPjBoh4JmXQvfwzbOQs0UgjKGxz4z4l7Frj2XokwOxkqO9nWAcyZ03NOGXCwsMxaYJ0Wwl7ArUGINM9O2n8nBFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774145506; c=relaxed/simple;
	bh=48ecGMCQ1eljubIJvWml0vxcjuLRyM39vCsG9yi60MU=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=oDRMApSm56XputMv9JXObUPLGxkSWa+k5eMO1nAmupAuVpDY+Fwzjkqc1Q1eK0DRaFNzOfk4ilP8gdedrEv2vtrf745Dopzc1D8/lahJiKUtZ8PJrglNiTNWhSI8xdLv2jSvElHdWkwnULXFdgc2EcslRUWC+k2kexeyA8Mj+hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 5963FC2BCAF; Sun, 22 Mar 2026 02:11:46 +0000 (UTC)
Received: from csamuel.org (csamuel.org [74.50.50.137])
	by smtp.kernel.org (Postfix) with ESMTP id CD21BC19421
	for <tools@kernel.org>; Sun, 22 Mar 2026 02:11:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CD21BC19421
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=csamuel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=csamuel.org
Received: from localhost (localhost [127.0.0.1])
	by csamuel.org (Postfix) with ESMTP id 3690340068
	for <tools@kernel.org>; Sat, 21 Mar 2026 19:11:35 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at csamuel.org
Received: from csamuel.org ([127.0.0.1])
	by localhost (csamuel.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yBJs7ba4KJWe; Sat, 21 Mar 2026 19:11:33 -0700 (PDT)
Received: from [IPV6:2601:41:200:4c40:a5e6:563a:28d9:958a] (unknown [IPv6:2601:41:200:4c40:a5e6:563a:28d9:958a])
	by csamuel.org (Postfix) with ESMTPSA;
	Sat, 21 Mar 2026 19:11:33 -0700 (PDT)
Message-ID: <2c1ab8a2-8a86-48a7-9a53-ef3a00ab4bd2@csamuel.org>
Date: Sat, 21 Mar 2026 22:11:32 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: tools@kernel.org
Content-Language: en-AU
From: Chris Samuel <chris@csamuel.org>
Subject: b4 review experience
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi there,

First of all thanks so much for this work, it looks really nice!  I'll 
also preface this by saying I'm not a kernel person, I'm not even really 
a programmer, just a sysadmin who likes to track what's going on in 
certain parts of the kernel.

Having seen Jon Corbet's mentions of the new "b4 review" feature I 
decided to try "b4" out from the git repo and I've got to say I really 
like it. It took me a minute to get to grips with it but I'm enjoying 
how it lets me look at patchsets and comments on them.

One thing I've noticed is that if the patch set is large then I can't 
scroll the list of patches on the left hand side of the review view with 
the mouse, though I can use the arrow keys to go through the patches.

A similar issue that if I run the CI (to get checkpatch and Sashiko 
input) I can scroll the list with the mouse, but I can't select any of 
the patches with the mouse. I can move through the list with the arrow 
keys but when I get to the bottom of the screen it doesn't scroll. I can 
scroll with the mouse to see where it's got to, but as soon as I press 
an arrow key it resets to the start of the list.

The only other thing I'll mention is that with the checkpatch output 
it'd be handy (for the complaints about lines in the commit message) if 
it showed the context like it does when you run it at the command line.

For my experiments I've been using two of the MPAM patchsets:

https://lore.kernel.org/lkml/20260319162225.378485-1-ben.horgan@arm.com/

That set has the checkpatch failure init.

https://lore.kernel.org/lkml/20260313144617.3420416-1-ben.horgan@arm.com/

That is the large (40 patch) set I mention.

But again, I really like this and for alpha code it's pretty good!

Thank you, all the best,
Chris
-- 
Chris Samuel  :  http://www.csamuel.org/  :  Philadelphia, PA, USA

