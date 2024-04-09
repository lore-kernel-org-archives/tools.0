Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE24A13D88A
	for <tools@linux.kernel.org>; Tue,  9 Apr 2024 17:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712682366; cv=none; b=sepHtNL5jzOnmyH+vq+HFiidzDRLTvF7txRdYG/m04nZoKl0UpGjUcZ4kGNaQyxHu7zoh4bdZ/huFpNRVCWwVQ9Uq+Q9cGUVF9TVjIw9i+tq6FWbaqasM8WVNNWccZfnDe70iPRHFs1LiT0/Ztsl5XRb4vbkvUZRjaZjAt7Z06U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712682366; c=relaxed/simple;
	bh=iLj5XNoTS39Q9B0iVi6LuZYHf9R0Du4aHpZfeFGXYPU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=s0NBT5A7Quh8x4ZrKHNz73g4OkzO7juwu4fUH5q/q45gNoSKtqtkkQs+PxQhOAnzUSIY5PeNJhaaxpcq/hc1wkzFRMttFZbcIFSeYX82pJmGrP+nLM23GsF9IPaPCfjHtx4eLbyHVHaUNlpctLFF8jTMCYW7DJCcir/t12nHSos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OFHxX9KC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OFHxX9KC"
Received: by smtp.kernel.org (Postfix)
	id 57266C433F1; Tue,  9 Apr 2024 17:06:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3A11C433C7;
	Tue,  9 Apr 2024 17:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1712682366;
	bh=iLj5XNoTS39Q9B0iVi6LuZYHf9R0Du4aHpZfeFGXYPU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OFHxX9KCn8IegdZ6sB3THT+rYIyU4gKVApBeKYCFjeas9ozM92Txw4UGzmXxpXdZw
	 dzknuhVS6e01dCwPooKPCZdtGE0AHHE9KwBNr3f4wSxEBslZZoQgii/e1elnoG2FdG
	 h+qHOeWiNypFrEUmVlP269QHToHGaMTIxnZihPSQ=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: thomas.petazzoni@bootlin.com
In-Reply-To: <20240409-check_if_branch_exists-v1-1-136504ad81c2@bootlin.com>
References: <20240409-check_if_branch_exists-v1-1-136504ad81c2@bootlin.com>
Subject: Re: [PATCH b4] ez: Add a check before returning a commit
Message-Id: <171268236583.168654.10853538008478323653.b4-ty@linuxfoundation.org>
Date: Tue, 09 Apr 2024 13:06:05 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev


On Tue, 09 Apr 2024 11:15:56 +0200, Louis Chauvet wrote:
> B4 prep utility only works when a branch is checked out. To avoid
> misterious errors at runtime, add a check and a runtime error with an
> explicit message when the current branch can't be found.
> 
> 

Applied, thanks!

[1/1] ez: Add a check before returning a commit
      commit: 3b691d28df6954e8fac742365a08c496f36a3738

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

