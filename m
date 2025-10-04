Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C221DB54C
	for <tools@linux.kernel.org>; Sat,  4 Oct 2025 12:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759581695; cv=none; b=kCH7Qz4PtKvwTiS7qzfw5C5O5MCVvsWxf4iljHJ0OQ2dz67+we25pWhwdOGIcpWy74dcV1GO1JoJLZ735wUc4E1n8lhCRkrVCKGkcMb4Li4yQDWr9vJ57mWhkEXEiIO6tk7JPYzlBij/6KNSENi14Ry7J3OvvCznB7BXi078TKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759581695; c=relaxed/simple;
	bh=Ebwyp3ulELHUfUKzbqmxKIN0BN5coMmkWZ2oKpBnNiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PD6hJQMbxk/GTwvIJgTraLaWAyi0MugTysxsSfq+Zw75fd7R95WK7llHmva+Lz4oB96v9Q/gXCJ68Qdgxptm2bGOc21bG6d7T51tRM6otKQv5Z1LWrQXtndKby9hGkSWmHTeAELmMXWxW6dY4p2rC6yG41afOvn8K1VRLlLn+Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QMO3WhN9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QMO3WhN9"
Received: by smtp.kernel.org (Postfix)
	id 7636EC4CEFA; Sat,  4 Oct 2025 12:41:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24A13C4CEF1;
	Sat,  4 Oct 2025 12:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1759581694;
	bh=Ebwyp3ulELHUfUKzbqmxKIN0BN5coMmkWZ2oKpBnNiM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QMO3WhN9r6bNMn6XtCYz+zcHlyrpjW5w18yrDW9wQ1wvUQ0ysdjZ9W05NxtOsFqVx
	 ZE9YxqD0YOiXoXcyX9PI+zlv64ptwQBa/FrK1cwmzZsxxfmtv3l9EBlLIJCQy6aCqp
	 9U+VZ0P75juWgAOsjtgJ2EKS5qsnrd1b8Pztds9I=
Date: Sat, 4 Oct 2025 08:41:32 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Christian Heusel <christian@heusel.eu>
Cc: tools@kernel.org
Subject: Re: [b4] Release tarballs missing & test failures
Message-ID: <20251004-dainty-armored-armadillo-e2a080@lemur>
References: <32207548-725a-488f-8815-bc208311482f@heusel.eu>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <32207548-725a-488f-8815-bc208311482f@heusel.eu>

On Sat, Oct 04, 2025 at 02:19:13PM +0200, Christian Heusel wrote:
> Hello everyone,
> 
> I maintain b4 for the Arch Linux distribution and noticed that for b4
> version v0.14.3 there have been no tarballs & signatures uploaded to
> https://mirrors.edge.kernel.org/pub/software/devel/b4/.
> 
> Is this intended or simply an oversight?

It was just an oversight. The tarballs should be there now.

-K
