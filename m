Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC3D482D0
	for <tools@linux.kernel.org>; Tue, 21 May 2024 17:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716313447; cv=none; b=Vxe/xLCWt7CDoTg+WUwZMDyRNj/pWKSYeldNXwxXkYwLKAZIpLs6Riryh52FQrI/r0oixuM8JD94mvgEe41JWasq4jwflBHVAImuV4EVOPdWJtu6xmc1nsRWi8fsV1ZJU0rZL9kmRVfRxJAx5n5720llVzs4TizdR1Gky0PiIRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716313447; c=relaxed/simple;
	bh=YKPnq07HhAIprup++ZaNbbDpGFZIqyXXv+Wq1ME3YQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aumpiFu2eT38Y3KvylRE2QpbLcr2A0jpq7JXyXMjh4dxyMr4smwuK32vlOxBSrTYklSfmnmn7fdSE97SJBTZjp3REyMlkgZF/KqJXoD7sm8NZAEVlD8iV4nw9sNjma1J2rDeePjOxQI2ziQpfia9siQezPlujKwL27yJE5JEMhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xdQkCkMB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xdQkCkMB"
Received: by smtp.kernel.org (Postfix)
	id 80E2BC32786; Tue, 21 May 2024 17:44:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39185C2BD11;
	Tue, 21 May 2024 17:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1716313447;
	bh=YKPnq07HhAIprup++ZaNbbDpGFZIqyXXv+Wq1ME3YQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xdQkCkMBHplTeJ6dzgHjyFVi2Kqp0AFqMeV0z/v+bRqLNZRsJROqtu/v5voWxLrS4
	 g6aDrEwZC8WNDNhdwHp1kFfJIFA5+OJUdJm+EQVDVmPqHU9dGgpRO19zAHdKZNFCqi
	 FFk19MkK2mXr13SRCRuN2P6KhdcgzoO1draOF+x0=
Date: Tue, 21 May 2024 13:44:04 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: tools@kernel.org
Subject: Re: b4 adds changelog before the cover letter
Message-ID: <20240521-silky-natural-tapir-80defb@lemur>
References: <20240521-curious-obedient-dove-cc79a8@houat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240521-curious-obedient-dove-cc79a8@houat>

On Tue, May 21, 2024 at 12:38:57PM GMT, Maxime Ripard wrote:
> I've just noticed that after sending a series, b4 add the changes 
> before
> the rest of the cover letter.
> 
> For example, I've just sent this series:
> https://lore.kernel.org/r/20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org
> 
> Prior to sending the series, this was the commit containing the cover letter:
> https://github.com/mripard/linux/commit/062e28a73fd2
> 
> Right after b4 send was done, this is now the commit:
> https://github.com/mripard/linux/commit/0d20a4123b4435c41177e2cc9122f7d335f7399e
> 
> It's not clear to me what is going on, but other series on other
> machines with the same system and b4 versions don't show the same
> behaviour, so it's probably an unlikely bug, or related to the local
> configuration.

This is because normally there would be a --- between the trailers and 
the changelog, e.g.:

  Cc: linux-rockchip@lists.infradead.org
  Cc: linux-sunxi@lists.linux.dev
  Signed-off-by: Maxime Ripard <mripard@kernel.org>
  ---

  Changes in v14:

That "---" is crucial for us to properly find the start of the changelog 
section. This logic can certainly be improved to be less fragile, but 
for the moment putting back the --- is the only way to fix this for you.

-K
