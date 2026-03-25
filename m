Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3DE20DD75
	for <tools@linux.kernel.org>; Wed, 25 Mar 2026 00:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774399873; cv=none; b=ZEv1HeHaxFfOHDAD3pl2F90pnQig2OpI1ptBOXfT3xq2ReL+H4XxZzGxV+4u/uv3+A5yJtPeUR8+sDSVoTsj9hh/UqahJmCnxd4W9O9YXehUSmLsAidlNRQenOEqD6NnlOeFW0nbjmMp6kJuYZA3l958DUbP5QAjGX3bznXdZxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774399873; c=relaxed/simple;
	bh=Y0F9yHI6Nggci8t4QiD7CDDu3RvgqH25eO/Ugs5SkWw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=akzxZ1oEcYVCDjpp0T8eEWHIozKOlZK6RgbcwW0r/sFSJyrlkmUD9ZaiH5fG7zC/7OpzTDlV7T77fH8e/eODRFxAH7KYI1GIBB3MmaUklvgcuF3NBOCyNQ7NXmpOvftmV0mHQgdgZl77mLzwNfiSbnzPR5dxQsrbZVWjD+LGYKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 089BCC2BC87; Wed, 25 Mar 2026 00:51:13 +0000 (UTC)
Received: from csamuel.org (csamuel.org [74.50.50.137])
	by smtp.kernel.org (Postfix) with ESMTP id 79E3AC19424
	for <tools@kernel.org>; Wed, 25 Mar 2026 00:51:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 79E3AC19424
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=csamuel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=csamuel.org
Received: from localhost (localhost [127.0.0.1])
	by csamuel.org (Postfix) with ESMTP id 0D25D40068;
	Tue, 24 Mar 2026 17:51:10 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at csamuel.org
Received: from csamuel.org ([127.0.0.1])
	by localhost (csamuel.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r6o9fFl77-Rb; Tue, 24 Mar 2026 17:51:08 -0700 (PDT)
Received: from [IPV6:2601:41:200:4c40:eeb2:e3a1:ead8:9e35] (unknown [IPv6:2601:41:200:4c40:eeb2:e3a1:ead8:9e35])
	by csamuel.org (Postfix) with ESMTPSA;
	Tue, 24 Mar 2026 17:51:08 -0700 (PDT)
Message-ID: <e1c2b0c9-1a9f-4a18-91e2-eec6f6f17170@csamuel.org>
Date: Tue, 24 Mar 2026 20:51:07 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: b4 review experience
From: Chris Samuel <chris@csamuel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
References: <2c1ab8a2-8a86-48a7-9a53-ef3a00ab4bd2@csamuel.org>
 <20260324-skinny-daft-nautilus-167b65@meerkat>
 <2762cb7e-b277-4722-b6a9-da11c771783f@csamuel.org>
Content-Language: en-AU
In-Reply-To: <2762cb7e-b277-4722-b6a9-da11c771783f@csamuel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/3/26 20:46, Chris Samuel wrote:

> My pleasure! I'm finding it very helpful for tracking this MPAM work.

Oh I missed one other thing I found - at least with my setup it doesn't 
seem to be possible to select text in the UI.

I found this when using the CI support - if Sashiko reports an issue 
it's not possible to select the URL to go view the report. However, if I 
run "b4 review tui --no-mouse" instead then that works.

All the best,
Chris
-- 
Chris Samuel  :  http://www.csamuel.org/  :  Philadelphia, PA, USA
