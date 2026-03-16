Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2943ED12E
	for <tools@linux.kernel.org>; Mon, 16 Mar 2026 19:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773691011; cv=none; b=rUbhaOcNbVB16r6xTXnnvkw87hBrJfFyNNfMj6bCn/AeVre6ySPSMhj2qG2ZRjJbn7Gl+V4eRO8W1F4nq57GilO9zASiB4MgnlQDdQtdEZzE39Z+EbCnaM0Q8S7KtaP3TJLKvWZxnJxPEpr//rbS5LyNp2OSJaoJAyKox3S28o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773691011; c=relaxed/simple;
	bh=/1G7LXpAdo9lY/HIvnQblOpcvHRV33oEjoy1+7x15N4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KLD/74CTlImdUBM05r7HveKKZ5N8KGA291pNhY7Y8Y4Xi2L6pcHWvOV8faKqh6NBJnC2dy1X5kSmRn+ZMhkRcIuSKBhivEyY58q1FcdYHawnFW0obXf3Z/nMH2wG7Q6aCJO7Wnmk2rTE6C7qVdXFxL0nVp88DBMNCT86me+smYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SKlptstg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SKlptstg"
Received: by smtp.kernel.org (Postfix)
	id C8FC0C2BC9E; Mon, 16 Mar 2026 19:56:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96AC1C19421;
	Mon, 16 Mar 2026 19:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773691010;
	bh=/1G7LXpAdo9lY/HIvnQblOpcvHRV33oEjoy1+7x15N4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SKlptstgvX+sr+/0i3qf59YB0W0P4xR50UifU/uK6BGKOZU3yQ7pdzgKi8GJAUkm8
	 FdVvOCID2fxNqBN1Lxn57Ky1EczVXdmcpO+t0qmohq1xFmwurLsAXHI9VXRz5gYJwQ
	 Qqd1PQKSB1xAI07n6+FjH9XFce3mna7+UsT9fYmE=
Date: Mon, 16 Mar 2026 15:56:49 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Tamir Duberstein <tamird@kernel.org>
Cc: "\"Kernel.org Tools\"" <tools@kernel.org>
Subject: Re: [PATCH b4 v2] review: implement reply to selected follow-up
Message-ID: <20260316-fox-of-glorious-gallantry-e105c4@lemur>
References: <20260316-review-reply-followup-v2-1-f0482c4e8241@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260316-review-reply-followup-v2-1-f0482c4e8241@kernel.org>

On Mon, Mar 16, 2026 at 03:55:14PM -0400, Tamir Duberstein wrote:
> Reply to the selected follow-up instead of collapsing all follow-ups
> from the same author into one sidebar target.

I think I merged this in already, just sneakily. Can you check that the latest
master does what you expect?

-K
