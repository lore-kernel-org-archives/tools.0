Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B017F214205
	for <tools@linux.kernel.org>; Wed, 22 Jan 2025 15:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737560200; cv=none; b=FqqewCxSDNo7cJbBYlxT2CS/IuEMMNuavd/9/SXYdRP/edwQoKLbkeJK/aJO1uOI1E0x7kwcRFamF/cjjhzy6nDpICQTSL8+Zqj8w2BuSxrCd11C1n7bjzg9/D7q45+kBo5Bomw6P09GgsW6oFumCAIg8+JKaXeSZR3vtkncKBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737560200; c=relaxed/simple;
	bh=0HdTU+56atrrjiwlRKWgD9G2U7VbueaRelkfEsxkIGc=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZB9vKhVW9cxIOz4irT/KtluCNGpmiQ/xV9DGz7ovUtX7Yo5H1MuiM8J7EaQj9Aw3Cb5RwyB/uC0NcwWfCgzTday86zVXxCxMQ2icNKynvpSV9//WkZoIqjGHsOIn/v5lsqoKHDRdBB5RNK2S72SgY6x6+QsGISc8Lc/RIPbHatM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=co5pzO6H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="co5pzO6H"
Received: by smtp.kernel.org (Postfix)
	id 3EE84C4CED3; Wed, 22 Jan 2025 15:36:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C3BCC4CED2;
	Wed, 22 Jan 2025 15:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737560200;
	bh=0HdTU+56atrrjiwlRKWgD9G2U7VbueaRelkfEsxkIGc=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=co5pzO6HcOpUNWViN5NCEQCV3f//47fuh5L0OOjGVQx2eG+cGwATnabViUy2ItwyE
	 vbMDi0UjZ40eqMWTFW5P3YoIfbfbm9aCEK+EDFc5bxv5LusWRP5N0xmlA5H/5ceTEZ
	 5PtwSbQl/VFG9noL1LBaS/NUeoK49psDsnzJYPiE=
Date: Wed, 22 Jan 2025 10:36:39 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
	Tamir Duberstein <tamird@gmail.com>
Subject: Re: [PATCH b4 0/5] Resolve some static typing errors
Message-ID: <20250122-flawless-logical-badger-d760cb@lemur>
References: <20241025-better-type-annotations-v1-0-9d7a00a8d754@gmail.com>
 <173755972553.457666.16721877756658243086.b4-ty@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173755972553.457666.16721877756658243086.b4-ty@linuxfoundation.org>

On Wed, Jan 22, 2025 at 10:28:45AM -0500, Konstantin Ryabitsev wrote:
> > This series slightly improves the quality of type annotations in the
> > project. It also adds development dependencies so they can more easily
> > be installed.
> > 
> > Unfortunately this is only a drop in the bucket; there are still 356
> > errors as reported by pyright. Without minimal tooling to ensure these
> > don't gress, progress will be difficult.
> > 
> > [...]
> 
> Applied, thanks!

Note, that I had to do a follow-up fix for the missing Generator type import.
I should have caught that during review, but missed it.

-K
