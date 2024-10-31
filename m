Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6561C8FA8
	for <tools@linux.kernel.org>; Thu, 31 Oct 2024 16:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730392715; cv=none; b=H7hPExl22HhFYLiKiYsCGzNqerqbXLuBXyt9HJU3fyGDTOLJAkF4H62+sf+a1ad3lDUGa4rxaLKNDz4SFvWjxGDOjtMWCfZy/XKSqvP3zfEFhmH+L9i3DzgwnfkDgW4xj0bi/5MhuB+0RaS51yMnIVCnyQ0YzxBxzWjGzGlME8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730392715; c=relaxed/simple;
	bh=ffCQ8vV52WLC26J9OKPtTEYhKHzdn6fWIzZvhSZHIh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O+GXMVsFX7NvWxFmHFZapnE7MYwwtIE9vukkcojIOGQ4Gn1Cf+4dlVCmH+gpixm/Z/Eu1aF4nUSyLE0HgB1bONldtoB1HUtiMETYoDjyPnjQpHbqoQCN35H7LqhaG7rSLteCpAAgAdlwVi09wiDM09e40UaCuvS09GhnPvQNRl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HhB3+zsa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HhB3+zsa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBA0BC4AF14;
	Thu, 31 Oct 2024 16:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730392715;
	bh=ffCQ8vV52WLC26J9OKPtTEYhKHzdn6fWIzZvhSZHIh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HhB3+zsa3CiTHgwcu2eb37xFhUNhXg06c8ClNmrr575daUwg7LSH74TIwdiaJA6Bn
	 F3aYmT7ct+03LQsqbwy0nsQN3zlXujsZ4fCWHuCg7pndhnBymvIhE91gW9OMiFXf9G
	 xKA62NPCWg4THJ14g0x7OILOQsCszwdDjImkLSfI=
Date: Thu, 31 Oct 2024 12:38:31 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Ricardo Ribalda <ribalda@google.com>
Cc: tools@linux.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: Bug in b4 shazam?
Message-ID: <20241031-rich-caribou-of-superiority-61f832@lemur>
References: <CANiDSCvSAVkSsdWzfGFHK2YZXy_dOHVeJOA7V0pmyzHzSm6iEw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCvSAVkSsdWzfGFHK2YZXy_dOHVeJOA7V0pmyzHzSm6iEw@mail.gmail.com>

On Thu, Oct 31, 2024 at 03:06:56PM +0100, Ricardo Ribalda wrote:
> Hi Konstantin
> 
> Our CI bot has encounter some issues with this series:
> 93d078e5-deba-4060-a32e-94bce677453c@xs4all.nl
> 
> it complains that the patch is corrupted:
> error: corrupt patch at line 27
> 
> But it looks like b4 generated the corruption.

It's a bit more complicated. It looks like the patch was copy-pasted into
Thunderbird, which is actually what introduced corruption. A well-formatted
patch has no blank lines in it -- the line has to either start with "+", "-",
or " ". If you view that commit with "git show --format=email", you will see
that both lines between .. +v4l2-alpha-component: have a space character
(replaced here with _ for clarity):

    +    necessary for hardware to work. This control is required for stateful
    +    encoders.
    _
    _.. _v4l2-alpha-component:
    _

However, when that patch was copy-pasted into Thunderbird, these blank spaces
were trimmed so, strictly speaking, this is no longer a well-formatted patch.

That said, git deals with it correctly, so I'll see if we can recover from
this corruption as well -- or at least not make it worse.

bugspray tag me

-K
