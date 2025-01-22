Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22FB38DC0
	for <tools@linux.kernel.org>; Wed, 22 Jan 2025 15:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737560450; cv=none; b=JZ5eF4HquHBKN4Iu2YoqK/7qK5oMrffxYF0kZKZ9l52yGiY7mPaVq4/JpSy+JWKzjtXUfqj98vOdoN6gl1TGAuFZ21vv4uL0Qbr45Mttj4JnzmJUNC1SOErE2XE72HJJvYPARMbH1lqS/KGlP/QBygBs4Axr0Ju5NUnX2lw8oxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737560450; c=relaxed/simple;
	bh=xtPqC9gCwNxf4NxzVGhrv/gTiADBio/vDiuHgfyjvjk=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Gtuz0nGTvYFORFXSLap24o37zOq6kKlJzLuvLmZGrohua2NFlnUOVfBol/TI6YxkPtVdPvC0mpxBB9PMLinuEI9vExbrAjmiNdwoV8GaCbxYXWrkIGJ6LMmt9Ydgud1Vkvy5TYeedk6gD0WWlGvM0WkTZjhCklkrrIVsqzotEW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2VkBSqjX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2VkBSqjX"
Received: by smtp.kernel.org (Postfix)
	id 4B23CC4CED3; Wed, 22 Jan 2025 15:40:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E98E8C4CED2;
	Wed, 22 Jan 2025 15:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737560450;
	bh=xtPqC9gCwNxf4NxzVGhrv/gTiADBio/vDiuHgfyjvjk=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=2VkBSqjX7KM3ib8hNUP2VZ0NmX8GsTEEvu98zL1qw3Kng2ENp7OTAgPn4bAYbFN/M
	 DzM/ehRoLT1d8/zJAjQWYsVJJRFik7saKtv0CIc6TPjKcosfqHvNvnJu3IymjfsOc0
	 Y/MOw3sOzOFfUHqfIg6n0Xy6rxIwG8jVGEvfZe4c=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Brandon Maier <brandon.maier@gmail.com>
In-Reply-To: <20241027-trailer-special-chars-v2-0-e963f78b3ef8@gmail.com>
References: <20241027-trailer-special-chars-v2-0-e963f78b3ef8@gmail.com>
Subject: Re: [PATCH b4 v2 0/6] Handle patch trailers with special
 characters
Message-Id: <173756044981.464266.12458339500397833373.b4-ty@linuxfoundation.org>
Date: Wed, 22 Jan 2025 10:40:49 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-be477


On Sun, 27 Oct 2024 17:34:53 -0500, Brandon Maier wrote:
> Fixes bug reported in https://github.com/mricon/b4/issues/50
> 
> Patch trailers that contain commas are not parsed correctly, this causes
> the trailer to be set to a blank string. The issue is special characters
> in emails are supposed to be quoted per RFC 2822. But it's fairly common
> for patch trailers to be hand-written and be improperly formatted.
> 
> [...]

Applied, thanks!

[1/6] src/tests: check trailer extinfo
      commit: 0d0d2e2e53013302d0625eefb4ee519166802c1b
[2/6] src/tests: fix trailer test hiding parser errors
      commit: 285445c83c066f8ba39657d8bf360df729b60002
[3/6] b4: handle trailers with improper formatting
      commit: cc2d6bfbc6d2b819d8d291c3b7470642893d69fa
[4/6] src/tests: test for trailers with improper formatting
      commit: e1ba36d1a62be7972c46668c89214dda00b8d6f9
[5/6] b4: handle trailers with special characters
      commit: 83327d2fbad9506afc2a3e30566025345e157eca
[6/6] src/tests: test for trailers with special characters
      commit: f147f985fa6ad6558603b83fa0a7bf38aeefd436

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

