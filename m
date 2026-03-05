Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C055835F5FC
	for <tools@linux.kernel.org>; Thu,  5 Mar 2026 23:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772754697; cv=none; b=B5IhL3uW7l2SqLS985MslCQZcpVg6xzUDDlaj2fbKHxEuNIblgw2YBRmenKKpEPyFQgk+J8JJHx0RcbczaIejVlnXhQbOCwEMphsidY9BO2K0MY//7a2ON46JNqqjZinJRk53romVERrX/qMYH+JGFK9HRK4WpkaS6kbUsWeC7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772754697; c=relaxed/simple;
	bh=U8tiEFGD8hzWRhiZza8CPTa4tbVmgjRwBsFUEKBk/ys=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=ZQwT6fgcy3ThFR5OBKRz3sD+dh9Oswcr0zlzqq8/x7ADGpVpIfrrGlF74lV7O1IbM8/Jv+mg3Qv1J7JvySWglBD0KWtzlv+YNRWOenQlvYKUWXDpcPTEtoZSZVddXYL3dPnVGpo+7o+s3ht5c+L09cBr5+kYStKd/xVYPHPfYjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IpNOygBk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IpNOygBk"
Received: by smtp.kernel.org (Postfix)
	id 7329AC2BC87; Thu,  5 Mar 2026 23:51:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CAB5C116C6;
	Thu,  5 Mar 2026 23:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772754697;
	bh=U8tiEFGD8hzWRhiZza8CPTa4tbVmgjRwBsFUEKBk/ys=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=IpNOygBkDZMfjtmRz1AUf2WWXGulzFP0u1M2t4I9g0PAuT7fcEQCA6QatRU4b0FSR
	 1FhCFLqP/Q4fmtOOImI/meHi25CFvdyH8r7++oduVRS1521KI3HuexPhy8NZuxxwv4
	 B3EC9Dvy9ul2nGbvYjQIsHhBjEg/FYdex1UIxZ9Rd9tanJ+nlhm0+S2BVjb1fRA6Wx
	 a3+1LBIZfZ18KApSrUZ771JiB9mKMmDJZZ7xsKQlp6KwGVPfwoDaGgzQV6Mu37Imxy
	 F4Z5q9q7qUyZSfoCzzzWVbzLhSHZW3ww2OaK9moNAZADZxqSkfdD/Us2SOzQ2Hr1vw
	 5qnNlcAgdag6g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 42CAA3808200;
	Thu,  5 Mar 2026 23:51:38 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: B4 Bugbot <bugbot+b4@kernel.org>
To: broonie@kernel.org, konstantin@linuxfoundation.org, tools@kernel.org, 
 bugbot+b4@kernel.org
Message-ID: <20260305-b2294e57541dec0d11c1b7f3180cbfa6c99c96f317431397405859c7a775742f0-101bee683e64@git.kernel.org>
In-Reply-To: <aa4a44c9-7fee-4dd3-aafe-dca46c7038d0@sirena.org.uk>
References: <aa4a44c9-7fee-4dd3-aafe-dca46c7038d0@sirena.org.uk>
Subject: Re: b4 dig not finding commits due to alternate sender emails
X-Git-Bug-Id: 2294e57541dec0d11c1b7f3180cbfa6c99c96f317431397405859c7a775742f0
X-Mailer: bugspray 0.1-dev
Date: Thu,  5 Mar 2026 23:51:38 +0000 (UTC)

Hello:

This conversation is now tracked by b4 bug tracker.
There is no need to do anything else, just keep talking.

--
Deet-doot-dot, I am a bot.
b4 bug tracker (bugspray 0.1-dev)

