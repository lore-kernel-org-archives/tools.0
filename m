Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8A864A80
	for <tools@linux.kernel.org>; Mon, 22 Jan 2024 17:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705944415; cv=none; b=f2wkokLnyTBVFwGl63ui1yk823pMnF8jItRGMfvwr/WxFVcBuDht6GUE3yhRdhwFwsX6kXjOiU97/9gFRbI6rzV5qXbz5HVdbProlue2IwZlaBTfKvBbQtTo9ybcl3/4pLxZCwxSIKxIUx3XlGh/UfmrVgottefaGrXTX9oPNHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705944415; c=relaxed/simple;
	bh=lFbFiACko0VTNTZlTSzvd3yjWF6ch+kqY0KAaKua2Gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=raJuQFXgyxSmwmzVGyRS2Biq9HQZzjY5lWqUS3QXjapqhrJHYgPA/8eBTSDEc6ZaeBhkuy2NIcVGZ09vazMzJYduf27EnBnvoXOmPFfp7+RFFl0GMq1p24UvBc4g4qmnPSipTxnd1GaPVu3/3mvoyfvoiUVEYGlb4ybolkx2/G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uOgOImu3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uOgOImu3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28D23C433C7;
	Mon, 22 Jan 2024 17:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1705944415;
	bh=lFbFiACko0VTNTZlTSzvd3yjWF6ch+kqY0KAaKua2Gk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uOgOImu3FTa3gJiQWQ5bzgMLrDO5T8vt+mPWxqWM66JLZTJvmLi3rDoLRuA2XQY2U
	 /4RIIEESZkvbDPjDubWpJtS9XgukWdTc6pKhHll1RfdM+Z492Pi/UtV2oiYseE7wrG
	 RfLpyxztJh1ywsZOFIfB/MlM1Ps3azR7iyZ7ipao=
Date: Mon, 22 Jan 2024 12:26:54 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: Scripting support for telling if a b4 series is sendable
Message-ID: <20240122-furry-llama-of-perspective-95f628@lemur>
References: <47699f5d-4ba3-4438-8a78-ab6c3345840a@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <47699f5d-4ba3-4438-8a78-ab6c3345840a@sirena.org.uk>

On Mon, Jan 22, 2024 at 05:21:35PM +0000, Mark Brown wrote:
> Hi,
> 
> b4 has logic for detecting if there is an unedited cover letter which
> would be used in sending.  It would be helpful for scripting around b4
> if it were possible to query to see if this check will fail separately
> to trying to send a series.

Makes sense.

bugbot assign to me

-K
