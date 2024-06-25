Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F85176ACA
	for <tools@linux.kernel.org>; Tue, 25 Jun 2024 17:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719336259; cv=none; b=YyajJhROt5Y4UbfXXQ5gS1NsWZsrarJXyBo03SNm1dc868UR5uJoy67F3DQYoY5m5y9ImGt9xTORBXeNVScedHCgusCwsB+S4ZMGmKzIyLRqPSweulbFwyQ7jTLJvW3AfjghwdelcwMrNyMB416C355R4RB26sM0zR1vV/G5gQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719336259; c=relaxed/simple;
	bh=uBYCisWzGApkQNtY/wpIJ7LOCbsj/7TWXolTxToWfz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pjTSVmAOYJ/U2OPXtpfXgO+KUCtvD0+tXciPdaBt/i50cLy0PjA8g4DvrrGYFZLNdJJ9vWM3SL8xR1kbM6z3T6dFVrcXTZOctohn7WJfI34PsVZjMpf4hR/b2hun4dw4xF15ZGBxbsfudynZuy+4pTFRAyF/AQdaqB9ZmTyK4DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=L+wztiSE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="L+wztiSE"
Received: by smtp.kernel.org (Postfix)
	id ABF05C32782; Tue, 25 Jun 2024 17:24:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73B2FC32781;
	Tue, 25 Jun 2024 17:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1719336258;
	bh=uBYCisWzGApkQNtY/wpIJ7LOCbsj/7TWXolTxToWfz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L+wztiSECBbjOEhzeGH9EllXX5jY2nkV4iDW8pGUxtTdABhDTXb4A5FsVQLauhcSw
	 1ECmvvqJumH/32+Ab7J3oiHcvg3p5COlqS5aaLmeLAprxjs6X0X79lS03h7Zy81lFA
	 X5w6hIrHzFSzxAMUhCGS0ZUm6//0j23635w9W164=
Date: Tue, 25 Jun 2024 13:24:13 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: tools@kernel.org
Subject: Re: b4 prep confused by rebase from linus/master to
 linux-next/master?
Message-ID: <20240625-voracious-flashy-galago-7632ec@lemur>
References: <fd4e083f-fd5b-490c-b0c6-4cae0acc6214@quicinc.com>
 <20240625-sepia-tarantula-of-diversity-adee66@lemur>
 <b4bdcc6e-95fe-41ae-bedc-9fc4ad385570@quicinc.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b4bdcc6e-95fe-41ae-bedc-9fc4ad385570@quicinc.com>

On Tue, Jun 25, 2024 at 09:05:15AM GMT, Jeff Johnson wrote:
> > Can you paste "b4 prep --show-info" for that branch?
> 
> I was already able to fix this by manually changing base-branch in the metadata.

Okay, I suspected that you have a non-default cover strategy, right?

-K
