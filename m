Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B4121FF24
	for <tools@linux.kernel.org>; Wed, 20 Aug 2025 14:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755699148; cv=none; b=TMd/fahs1hvdE3mIbuUYYQQOua7vJzx4lsMyVCW37rdf/2SKx8rjNhCweSu5itQPh72jsS0Gh+0A8+8rB9p84xmDPhbNNwZehv4Z5u2dJzN7l4sBRgZD1iQuebSPdi7aoCkrg2ry7extDZHxXQtmR6r2r2qESfJRJNO9xq3s87c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755699148; c=relaxed/simple;
	bh=/cxScerDv9e9sEdjjLvEJeWy3HSOS0XauXVFVwcN0js=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UyqaZ2cGUOCeLXmGKenPe9z54Ef3sIp1K2CLYNwt9T/wRG8q3id2PU03CwbdrXxtWyUTtUxxIchb+vgiDnud+GijhPoqZyxleJJoQslPmCrl71/IJQwKk+Zmmep4Miv1mMKoj0qkxkRtG2+53iosXW4K4WoO9BPuoQaE5iuDIXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=eVHdgKhV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eVHdgKhV"
Received: by smtp.kernel.org (Postfix)
	id 50EC6C113CF; Wed, 20 Aug 2025 14:12:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06EB0C4CEEB;
	Wed, 20 Aug 2025 14:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1755699148;
	bh=/cxScerDv9e9sEdjjLvEJeWy3HSOS0XauXVFVwcN0js=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=eVHdgKhVHll5pWeKDKYgD+tf9/pKs1XRRgpuboOyi+4IhZRHg6PPpOLDTHmwevVe2
	 b6FPWSO7X3ZM0WNkr7NQLko6Qujl+GFl32kv2Pi1CEGUe6ojo/nXAghj2oJk4K/IZd
	 ucS5MrLL1YMIp2f1eFTHUUP6hjxVQriUCHrMPWQ4=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <20250819-ver_check-v3-1-9877d033bb7d@oss.qualcomm.com>
References: <20250819-ver_check-v3-1-9877d033bb7d@oss.qualcomm.com>
Subject: Re: [PATCH b4 v3] Add Git version check to prevent crash with
 '--default-prefix' parameter
Message-Id: <175569914790.209687.11511224034097163761.b4-ty@linuxfoundation.org>
Date: Wed, 20 Aug 2025 10:12:27 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-2e5ae


On Tue, 19 Aug 2025 14:22:24 +0800, Yijie Yang wrote:
> The '--default-prefix' parameter was introduced in Git 2.40. Environments
> running older versions may crash with errors like:
> 
> CRITICAL: Failed to convert range to patches: Could not get a patch out
> of 5f8e8d5b2c840f8fc5185c2f90d6d275535a6aea
> 
> This change adds a version check to ensure compatibility and prevent such
> failures.
> 
> [...]

Applied, thanks!

[1/1] Add Git version check to prevent crash with '--default-prefix' parameter
      commit: 2e5aec1cd7ec324580cde475c3ff6a04a9bf8a50

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

