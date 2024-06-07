Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB6C19752F
	for <tools@linux.kernel.org>; Fri,  7 Jun 2024 14:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717769970; cv=none; b=fi2dzaSU+3m/oL522rOVEnPVa83iSqy1mvH9vDIlYzKQOlo+dzbeLXrWyMxaFFw3LYddYF8X35HixlBM3J4HCPC4doIkK4QEBElIAa5Sz2DmZgSQv+VqNNF4fW3S81E53PJosS9ACYiT/ECRPmtpL6YaV7Xf+0H5leviZMtegbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717769970; c=relaxed/simple;
	bh=DXIUMsx9bdPeMYOf51FNrKLT+WxUCK5fRHJ2VrKVo/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aUWmXduFVaQfth5riMHCvKmK41sd7NGHfrLLrZNcnD31R2yOOQvXW/F3tFbNG2TSf/0r7OmK6c9XPjrn0UtYNSLW0EqsRn0MUG7rzaXKiqz3SJQ7B5hEmRB9g5fdB/RCi3neKsksdgV06uP7bmKe/cjNZPBs4+H7RUwBPQNUAPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=i+3+eqVo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="i+3+eqVo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28A47C32786;
	Fri,  7 Jun 2024 14:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1717769970;
	bh=DXIUMsx9bdPeMYOf51FNrKLT+WxUCK5fRHJ2VrKVo/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i+3+eqVogyiCeoad9HqlTiQzJXJt67jq3yj0hmQ1/xkHjPtYkaup1XbDwgZ7MFHtW
	 V1ETuk+uLDISnTyhF9th/EJxu6+xIUCPXn+1r9HFJ9SuFGxwWhqlbFfzny4k9S+Pza
	 6CLT/ZyCs7qnqrzw5BOTQLNnvlWyLXqW/pl4+HWg=
Date: Fri, 7 Jun 2024 10:19:26 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools <tools@linux.kernel.org>
Subject: Re: b4 prep from lore picks up versioning confusingly
Message-ID: <20240607-tan-marmoset-of-cubism-5fab4e@meerkat>
References: <ZmMNp1_rMSMXHgFD@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZmMNp1_rMSMXHgFD@finisterre.sirena.org.uk>

On Fri, Jun 07, 2024 at 02:39:51PM GMT, Mark Brown wrote:
> and the changelog for v2 in the downloaded series.  I would have
> expected to see revision set to 3 and v2 in the history, v2 was clearly
> sent.

I can see your logic, but I can also see other situations where this would be
undesired behaviour, for example if someone creates a branch from a series
they mailed to themselves (or dumped into a mbox file). I'll think about it
some more, but in your case it's fairly easy to get to where you want to be by
running:

    b4 prep --manual-reroll [cover-letter msgid or link]

-K
