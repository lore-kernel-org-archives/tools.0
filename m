Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B101F95E
	for <tools@linux.kernel.org>; Mon,  4 Nov 2024 14:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730729774; cv=none; b=JqCurjNHFk29wMMXZOVX3Yqlw2QYuqxqpu/he7UOcaqvYcYkeG4kFfxz1IdiWuyU95PhWIDy7Bc7/m6JroJH+nJ+1DnxYxbwPIMrNADwNvx4ZIF2+N0Oda7RKmraaguAyZ6ObhAnhk8AuKKfp3Zsgn4PnLnYL0o0vqKgHeBWL8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730729774; c=relaxed/simple;
	bh=mptR/pBNpZwNjaRipg86HAavd7PDzNJkItlD+RxV/3I=;
	h=Content-Type:From:Mime-Version:Date:Subject:Message-Id:To; b=cvLPuR8GRwScGyflVvVZIzGMHUq6sKOafrWyjMGcX1AAgiXKOvI4q7lKQ6zBojuQcx+2bz18v2n74QtPc879rcTI2QNEfTpnJVWpDGhVysF9vYaVI4WmhYpHVa7Nt+Bw9QnRfvyZ17YGmsCm/p17/HjA1jVzmqw36uQsNKZ6nS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=Wd6nx+FT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="Wd6nx+FT"
Received: by smtp.kernel.org (Postfix)
	id 5CD27C4CED1; Mon,  4 Nov 2024 14:16:13 +0000 (UTC)
Received: from ci74p00im-qukt09081902.me.com (ci74p00im-qukt09081902.me.com [17.57.156.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 961DDC4CED2
	for <tools@kernel.org>; Mon,  4 Nov 2024 14:16:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 961DDC4CED2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=icloud.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1730729771;
	bh=mptR/pBNpZwNjaRipg86HAavd7PDzNJkItlD+RxV/3I=;
	h=Content-Type:From:Mime-Version:Date:Subject:Message-Id:To:
	 x-icloud-hme;
	b=Wd6nx+FTkSNqcdlFHlbSdAWviBSBxQwuETi+CAlnhFFELkQN4O05DEq5KxOAeQpI3
	 f3ruijx78l+00uDjxtywH8ZQfvqrLoBrevy2HkFJ9G1lzSjZH/lfUiC0wmvTsS4FKI
	 qtIYmqaNlt0xvnJHxbkvLlO48etkSO0SDNivL+ZxiSGi3hvrgHtQZWwLEIKrx/5KdT
	 dTF1El3bA9oZM9BJQWIByPiuIPxCHbKmLxZjBVnCnqlplgjnu5Ik+k+veH7R7bSe+N
	 S8gYUwrFTbqNSlI+fvDGXTEySk/Z1ZcJ1gAryaLeeaZtzLidpASeJsPZMIhEtM5EHs
	 QBIUljqHr2plA==
Received: from smtpclient.apple (ci77p00im-dlb-asmtp-mailmevip.me.com [17.57.156.26])
	by ci74p00im-qukt09081902.me.com (Postfix) with ESMTPSA id D491529003AA
	for <tools@kernel.org>; Mon,  4 Nov 2024 14:16:09 +0000 (UTC)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
From: Brandon Hamilton <deimosfit@icloud.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
Mime-Version: 1.0 (1.0)
Date: Mon, 4 Nov 2024 08:15:58 -0600
Subject: Hey
Message-Id: <62F7F341-4217-47D7-AD59-72C0087C246D@icloud.com>
To: tools@kernel.org
X-Mailer: iPhone Mail (20H350)
X-Proofpoint-GUID: wW87HR7ziABNcZkr_3nfpYjY0P7tsxlO
X-Proofpoint-ORIG-GUID: wW87HR7ziABNcZkr_3nfpYjY0P7tsxlO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-04_11,2024-11-04_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011 suspectscore=0
 bulkscore=0 mlxscore=0 malwarescore=0 spamscore=0 phishscore=0
 mlxlogscore=658 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2308100000 definitions=main-2411040124



-Hamilton
