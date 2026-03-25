Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046D914EC73
	for <tools@linux.kernel.org>; Wed, 25 Mar 2026 00:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774399608; cv=none; b=lNRiSF7ObEkMpefuzAxNauOrAKrFO4YfZPRwgdjqzFDzASsbT3c645EZnR4aWqrPMoFQRM/k4P2M1uJzON8iC+ytb3rSo92fEBpt/sQVqQBhdPralOCLqlQfheqBkhl3k6Kv0bRvnqEwj2EzhLSoAeRprkfoIX99Z1/3zgZ68tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774399608; c=relaxed/simple;
	bh=/NuH9sTuZdQB4av7S+4HYK/JzQ/cQHubQv6naNv9aco=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y+vnUh7cMw0H3NPVGBDci0tk7zb9qESlAL18KoFhS/bqmoGLy710dFJEGRW6w6m8f2SKj4fM7iR97c9kIzCghSHBeVyn5rTpPhGgHO4pUNIEZjUwGWT1S7/EIhLJajgbNlDiy6+kcQdcnX/yQXQKqoBFB46VzcTmzFm5wsPa42k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id B6D2BC2BC87; Wed, 25 Mar 2026 00:46:47 +0000 (UTC)
Received: from csamuel.org (csamuel.org [74.50.50.137])
	by smtp.kernel.org (Postfix) with ESMTP id 031BCC19424
	for <tools@kernel.org>; Wed, 25 Mar 2026 00:46:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 031BCC19424
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=csamuel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=csamuel.org
Received: from localhost (localhost [127.0.0.1])
	by csamuel.org (Postfix) with ESMTP id 887ED40068;
	Tue, 24 Mar 2026 17:46:38 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at csamuel.org
Received: from csamuel.org ([127.0.0.1])
	by localhost (csamuel.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5rFfgHFvqQQ4; Tue, 24 Mar 2026 17:46:36 -0700 (PDT)
Received: from [IPV6:2601:41:200:4c40:eeb2:e3a1:ead8:9e35] (unknown [IPv6:2601:41:200:4c40:eeb2:e3a1:ead8:9e35])
	by csamuel.org (Postfix) with ESMTPSA;
	Tue, 24 Mar 2026 17:46:36 -0700 (PDT)
Message-ID: <2762cb7e-b277-4722-b6a9-da11c771783f@csamuel.org>
Date: Tue, 24 Mar 2026 20:46:35 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: b4 review experience
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
References: <2c1ab8a2-8a86-48a7-9a53-ef3a00ab4bd2@csamuel.org>
 <20260324-skinny-daft-nautilus-167b65@meerkat>
Content-Language: en-AU
From: Chris Samuel <chris@csamuel.org>
In-Reply-To: <20260324-skinny-daft-nautilus-167b65@meerkat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hiya!

On 24/3/26 14:42, Konstantin Ryabitsev wrote:

[...]
> Thank you for taking time to send your comments!

My pleasure! I'm finding it very helpful for tracking this MPAM work.

[...]
> These both should be now addressed in 0.15.1. Thanks!

Thanks so much, I'm building from git and those are both indeed fixed. 
Much obliged!

[...]
> This is a bit harder to implement without the UI becoming unwieldy, but I'll
> take a look -- it's now in plan.otl for 0.16.

Thanks for considering it, and good point.

All the best,
Chris
-- 
Chris Samuel  :  http://www.csamuel.org/  :  Philadelphia, PA, USA
