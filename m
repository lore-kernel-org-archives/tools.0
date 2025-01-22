Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0EFEED8
	for <tools@linux.kernel.org>; Wed, 22 Jan 2025 15:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737559969; cv=none; b=f3JrL3DU6/UmFNn2/JSP5keCyy2oIhk5QQQlTkihxXTBBcKfACqLy9kXN9BcGEaWlqsOE1uyeK796glTbjP1Q2Eec4CAzZywmtKtTDr7BMkH4CfKIjR7WDZDjWcrOaGfVH7rRcsUOs8oLFWYq8V0A3xyx0daMmxmOUO91mZUoj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737559969; c=relaxed/simple;
	bh=F5vrZF2z/L8926dGt6BsKAYxDvJAtgkn1fX+OJ0fcJI=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QyNJhkb8cn/bjr7hnwRlNggycYKFv8WDwq1fBzt3ct1Fk/qi92C27dYS0tAk60mExl/tAi7OXWYC4MVf8Q+TBIRYH8pMkdrW2xi3j/Xx/4Zb515YwgOXOlEFjbZXfg9Qe4M25QHqMs+rjz788yHhyFYsc4VGKaEOLg8df0M7xqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=saFX6yDo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="saFX6yDo"
Received: by smtp.kernel.org (Postfix)
	id 697DAC4CED6; Wed, 22 Jan 2025 15:32:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14D92C4CED2;
	Wed, 22 Jan 2025 15:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737559969;
	bh=F5vrZF2z/L8926dGt6BsKAYxDvJAtgkn1fX+OJ0fcJI=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=saFX6yDo3JxtHZXOEhyR2p+1IeWlFM+itascz7yWekW09tzWbiF+qe0/ELAQUrz+I
	 kW2rxIMmiAAFkLEJVX5jMILk6bE4VcIDAGegyFFleZRXnXi3Eu1ZhL9JQ+0crgt1QU
	 1P2AFAExTEXgbuJijJip5z3xBx55650iB3T/rYgM=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org, Andrey Albershteyn <aalbersh@redhat.com>
In-Reply-To: <20241003160021.1786695-2-aalbersh@redhat.com>
References: <20241003160021.1786695-2-aalbersh@redhat.com>
Subject: Re: [PATCH] b4: handle invalid timezone value
Message-Id: <173755996892.459162.7037923150870606918.b4-ty@linuxfoundation.org>
Date: Wed, 22 Jan 2025 10:32:48 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-f329c


On Thu, 03 Oct 2024 18:00:22 +0200, Andrey Albershteyn wrote:
> If timezone value in "Date:" field is invalid (out of -24h..24h
> range) then b4 fails with following error:
> 
>   ...
> 
>   File "/nix/store/7sz8qnm7csfyxfj2k8v8p8w3ar5h0b13-b4-0.13.0/lib/python3.11/site-packages/b4/__init__.py", line 1239, in __init__
>     self.date = email.utils.parsedate_to_datetime(str(msgdate))
>                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/nix/store/h723hb9m43lybmvfxkk6n7j4v664qy7b-python3-3.11.9/lib/python3.11/email/utils.py", line 205, in parsedate_to_datetime
>     tzinfo=datetime.timezone(datetime.timedelta(seconds=tz)))
>            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> ValueError: offset must be a timedelta strictly between -timedelta(hours=24) and timedelta(hours=24), not datetime.timedelta(days=4, seconds=10800).
> 
> [...]

Applied, thanks!

[1/1] b4: handle invalid timezone value
      commit: e06aaaf86eae812257264f3b18c030da770eae46

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

