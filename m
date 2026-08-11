Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1167C35676A
	for <tools@linux.kernel.org>; Tue, 11 Aug 2026 23:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786490466; cv=none; b=bz2Bz4rbXxSuXirzu23f8ngrGWcoIJ9kUTNtmCHo+gFLS5Kag0mjvtcnH2tGtW/7qVUH2jCwzVU37reVWVrpkLL2TcfMPJ8eB1DbD7Zkz72sVYMSvPy2O7QGKUDmG4fdZzxSkICtMZ3JlRJVvF8EJaM9eExqk0JFd01TJi+Pna4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786490466; c=relaxed/simple;
	bh=wwn4f03YHYksUngoqT7DghB/7eUrZF21c1EHf5/V7JM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fsWgRwHuAZKidAZ4FYzLjFu8fQqr6LzvfBeflr/0SlhOscZ8+AjcFNKXpHp4swFhmQzmCRzK2AT3kxZiQ0aiuCMSjsb/KdDtvLjEvS35PEiQliz9fgbqXwi6ShSWOPcKaQt+HDkTATggtXcPIQR4sH0RcSsamEjMYbtW35YWV6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=sqEgLBNL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sqEgLBNL"
Received: by smtp.kernel.org (Postfix)
	id A06151F00A3A; Tue, 11 Aug 2026 23:21:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E18D1F000E9;
	Tue, 11 Aug 2026 23:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1786490464;
	bh=ryoBYCt7V/DyI5pHBE7pZpolq3O9GU96h2SKQzIztTQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=sqEgLBNLmNCmJX5t3q0ZsMTArybbVQsMxhhU5COEa5fa74aXFkOjpVIL+feGYcGoB
	 HTSo2FjAreWb8nKTUUWW9tb+ky02JkPpef13rMICCSDIC9jBPXOCWIVOxZEs6s683x
	 qrP0cWwsU0q0zCnVc/dGRlPvBEdX1jNbUxO2gZx0=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
In-Reply-To: <20260807180213.599509-1-broonie@kernel.org>
References: <20260807180213.599509-1-broonie@kernel.org>
Subject: Re: [PATCH] review-tui: Provide progress indications when
 upgrading a series
Message-Id: <178649046119.9692.18438835558342605129.b4-ty@b4>
Date: Tue, 11 Aug 2026 23:21:01 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=350;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=tJoycq+xI6e9iIIBbIbaz2HRCM8aGKl2DC80TqGqVUU=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLKq18U/fHWk6mn+hr2ZJzVLWvrvxZ89FbnVzujaauWjr
 unH50WbdpSyMIhxMciKKbKU7YvdFFT40EMuvccUZg4rE8gQBi5OAZjIEzaGX8y5Zi1563a8s/Fj
 e/D0hFOLe5PSw2fpiUZNvv/D9eMaHRgZ3huJXbJV23mMN76d02GK4dQgnSvirVOsIiR63nSbc5e
 xAwA=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Fri, 07 Aug 2026 19:02:09 +0100, Mark Brown wrote:
> review-tui: Provide progress indications when upgrading a series

Applied, thanks!

[1/1] review-tui: Provide progress indications when upgrading a series
      commit: cde64701deebd7a60af31ce44d322ce402937bdd

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

