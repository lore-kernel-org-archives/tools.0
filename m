Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E993DCD80
	for <tools@linux.kernel.org>; Tue, 15 Sep 2026 15:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789487904; cv=none; b=jj/PfGwR1hAS0huuhqLIvjHgz5fCxNq7zSAng9u7a0pa6dODgUE0UE+MD+aOFME6KTAxgJ8m+DT+bEyoriS8fNWnPWTn0hlzap/H/xFcBxZihd7DLbPV/ZagHvCrqTHjqdGbBBJSYUQ9paOE2htTXIJwlvja3yR43q44nO9jUwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789487904; c=relaxed/simple;
	bh=1TQOvhzGqfrxvl8HLc/4r42Hwnp5s6B/UqADy/NFMgQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Pl0Vrb/XAuLF+hrmq9bymB5eJPVEvX32/Gd/WxtFc7J/xioK/0UkbnW/I9O/tAPPOB18F/I78kCund/YrnLCeJwm5no659XoGNQdIiP3/eus6oo5uV5UkQidwTfSR3qK9ofvxSYPQI0j2fU7JcT6CpsFxdA38nF8h+x0rgt36Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1+7McsJ8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1+7McsJ8"
Received: by smtp.kernel.org (Postfix)
	id 3993E1F00893; Tue, 15 Sep 2026 15:58:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D757F1F000FF;
	Tue, 15 Sep 2026 15:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789487903;
	bh=TzSUD0Wno38G7Xv5U9X9vDDmAtAHOtjpwJUAzzNBFOA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=1+7McsJ8mIMynKJRbphWn5UWEQQyTAhLDPfqWJDioiyeFKYVZHq6HDdQX6HbdGixg
	 I/LcsU8b3AwSivdB74JCKNkSRLBvE6R+KhkxaQk+dacr+k/UmxEN9HH7JMsl+H/L3o
	 KVN8mUqQ0noZzpMtjKV3mzbsWx9sgPnlIj4kRD6c=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Konstantin Ryabitsev <mricon@kernel.org>, 
 Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
In-Reply-To: <20260831202823.577965-1-broonie@kernel.org>
References: <20260831202823.577965-1-broonie@kernel.org>
Subject: Re: [PATCH] review: Add a 'cleanup' command
Message-Id: <178948789946.2456.4297622164413359167.b4-ty@b4>
Date: Tue, 15 Sep 2026 15:58:19 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=284;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=J85HmA5rM2Er+ZQvibrsk/yWnmIG7MCK3R/TiN6Ab0g=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLJWZsvefiC8hDc7w9JkSV4Y892Up++iDtw3nS5RLt01b
 bfS7VkrOkpZGMS4GGTFFFnK9sVuCip86CGX3mMKM4eVCWQIAxenAExkex/D/xCp3T0+dkZHitZ+
 ivw/cQ8/V+/TQr8VrgVc+Sc3Pn1zdhcjw6rwKzzypzs6jefyvLx/QXjRBZZzDB8dM7f3vpr9+pL
 UF0YA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Mon, 31 Aug 2026 21:28:23 +0100, Mark Brown wrote:
> review: Add a 'cleanup' command

Applied, thanks!

[1/1] review: Add a 'cleanup' command
      commit: 1536a974c8328dd2fcd4c51dd1fb1bbf53be57a6

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

