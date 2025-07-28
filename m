Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487C2433C4
	for <tools@linux.kernel.org>; Mon, 28 Jul 2025 14:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753711792; cv=none; b=Me/ytlvdOHgfnQ1tgALBWY5TCn/h1Ok/bDUxHZevLkcBG/1MaO+ggtrHGcU0Sej4ymsmI82oPXtOrkitAbPbqhp9u3R/Gej2stQBQmTJeBV0F+shyvibBB0d9s5XLs/FKW2aV/ZhQM2XcBT+PIjXHfXfwXLhxq545c7LlMhrnFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753711792; c=relaxed/simple;
	bh=MZtpn/F+zpafmIAE3SQNU4TUbK0Vb7ffUn0Y30dZiTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DF8B8gQJOgjocF/pnJiqaBqB0ENAwzYKRGSgIOlmp/8BW8Xs2Pp/pB2KR1mMZniK3uqunCjMsEzHNK/sTX2qTCsENEZ3KV+6chcr8oRE31KCz5F8EHFHcQVsYW5FUmqvy3jg/qr0/rtjWPvYYfKfZcPif486JQjXCMdBoEZSkT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=r+BzXTul; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="r+BzXTul"
Received: by smtp.kernel.org (Postfix)
	id 8F400C4CEF8; Mon, 28 Jul 2025 14:09:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 586BCC4CEE7;
	Mon, 28 Jul 2025 14:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1753711790;
	bh=MZtpn/F+zpafmIAE3SQNU4TUbK0Vb7ffUn0Y30dZiTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r+BzXTul/U5V44JFhdvDXuuyf4JUR8UfsPrntEtHMUCb7vHNDJk555HB7EbfSHjYj
	 YHTLOxAGZeSkPs6Ub9v40sVIPuhTUoNTj3l5jXL19LIddJcFRjtPJLjc7DmhvEmUBG
	 GXZ6qK8R7538vSyQA1qjgBP79VtcU9Tyl8i8MbqM=
Date: Mon, 28 Jul 2025 10:09:49 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: b4 bug: "Error tagging the revision" in project with git
 submodules
Message-ID: <20250728-bald-wise-bison-febf6e@lemur>
References: <CAAjaMXYtY62_KeEbshWA4vjhtUzNgTO0wffcZXNy95EqvL+Ovg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAAjaMXYtY62_KeEbshWA4vjhtUzNgTO0wffcZXNy95EqvL+Ovg@mail.gmail.com>

On Mon, Jul 28, 2025 at 03:01:51PM +0300, Manos Pitsidianakis wrote:
> Hello,
> 
> When doing `b4 send` on the QEMU project, all works well except
> tagging the revision fails, I assume because the temporary git
> worktree doesn't have all submodules (perhaps some of them have not
> been "update"d to be fetched locally?)

Okay, I was never really happy with the way I implemented this via tagging, so
this may be the reason for me to get back and review how it's done.

Thanks for the report.

bugspray tag me
