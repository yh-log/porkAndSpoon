package kr.co.porkandspoon.dao;

import java.util.List;
import java.util.Map;

import kr.co.porkandspoon.dto.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserDAO{

	/**
	 * author yh.kim (24.12.20) 
	 * 아이디 찾기 시 사용자 검증
	 */
	String findUserId(UserDTO params);

	/**
	 * author yh.kim (24.12.20) 
	 * 비밀번호 변경 메서드
	 */
	int changePassword(UserDTO params);

	/**
	 * author yh.kim (24.12.22)
	 * 기존 인증코드 조회 
	 */
	int randomCodeCheck(UserDTO dto);

	/**
	 * author yh.kim (24.12.22)
	 * 기존 인증코드 업데이트
	 */
	void randomCodeUpdate(int codeCheck);
	
	/**
	 * author yh.kim (24.12.22)
	 * 새로운 인증코드 삽입
	 */
	int randomCodeInsert(UserDTO dto);
	
	/**
	 * author yh.kim (24.12.22)
	 * 인증코드 검증 메서드
	 */
	int chackAuthCode(UserDTO dto);

	/**
	 * author yh.kim (24.12.22)
	 * 인증코드로 사용자 id 조회
	 */
	String findUsername(UserDTO dto);

	/**
	 * author yh.kim (24.12.22)
	 * 비밀번호 찾기 시 사용자 검증
	 */
	String findUserPw(UserDTO dto);

	/**
	 * author yh.kim (24.12.23)
	 * 직원 아이디 중복 체크
	 */
	int usernameOverlay(UserDTO dto);

	/**
	 * author yh.kim (24.12.23)
	 * 부서 리스트 조회
	 */
	List<DeptDTO> deptList();

	/**
	 * author yh.kim (24.12.24)
	 * 직원 등록
	 */
	int userWrite(UserDTO dto);

	/**
	 * author yh.kim (24.12.24)
	 * 직원 이력 등록
	 */
	int userCareerWrite(UserDTO dto);

	/**
	 * author yh.kim (24.12.24)
	 * 직원 프로필 이미지 등록
	 */
	int userFileWriet(FileDTO fileDtoList);

	/**
	 * author yh.kim (24.12.24)
	 * 직원 정보 조회 
	 */
	UserDTO userDetail(String username);

	/**
	 * author yh.kim (24.12.24)
	 * 직원 이력 조회
	 */
	List<CareerDTO> userCareerDetail(String username);

	/**
	 * author yh.kim (24.12.24)
	 * 직원 정보 수정
	 */
	int userUpdate(UserDTO dto);

	/**
	 * author yh.kim (24.12.24)
	 * 기존 직원 프로필 이미지 삭제
	 */
	int userFileDelete(UserDTO dto);

	/**
	 * author yh.kim (24.12.24)
	 * 직원 리스트 조회
	 */
	List<UserDTO> userList(PagingDTO pagingDTO);





	/**
	 * author yh.kim (24.12.26) 
	 * 부서(브랜드) 등록
	 */
	int deptWrite(DeptDTO dto);


	/**
	 * author yh.kim (24.12.26)
	 * 부서 수정
	 */
	int deptUpdate(DeptDTO dto);

	/**
	 * author yh.kim (24.12.26)
	 * 기존 부서 이미지 삭제 
	 */
	int fileDelete(String pk_idx, String code_name);

	/**
	 * author yh.kim (24.12.26)
	 * 부서 리스트 조회
	 */
	List<DeptDTO> deptGetList(PagingDTO pagingDTO);

	/**
	 * author yh.kim (24.12.26)
	 * 브랜드 생성 요청 리스트 조회
	 */
	List<ApprovalDTO> deptCreateList(PagingDTO pagingDTO);

	/**
	 * author yh.kim (24.12.26)
	 * 브랜드 삭제 요청 리스트 조회
	 */
	List<ApprovalDTO> deptDeleteList(PagingDTO pagingDTO);



	/**
	 * author yh.kim (24.12.27)
	 * 직영점 등록
	 */
	int storeWrite(DeptDTO dto);

	/**
	 * author yh.kim (24.12.27)
	 * 직영점 수정
	 */
	int storeUpdate(DeptDTO dto);

	/**
	 * author yh.kim (24.12.28)
	 * 직영점 리스트
	 */
	List<DeptDTO> storeList(PagingDTO pagingDTO);

	/**
	 * author yh.kim (24.12.29)
	 * 직영점 생성 요청 리스트 
	 */
	List<ApprovalDTO> ceateStoreList(PagingDTO pagingDTO);

	/**
	 * author yh.kim (24.12.29)
	 * 직영점 폐점 요청 리스트
	 */
	List<ApprovalDTO> deleteStoreList(PagingDTO pagingDTO);

	/**
	 * author yh.kim (24.12.30)
	 * 직영점 비활성화
	 */
	int storeUseUpdate(DeptDTO dto);
	
	/**
	 * author yh.kim (24.12.31)
	 * 인사이동 리스트 조회
	 */
	List<UserDTO> employeeTransferList(PagingDTO pagingDTO);

	/**
	 * author yh.ki, (25.1.1)
	 * 직영점 이동 리스트 조회
	 */
	List<UserDTO> storeTransferList(PagingDTO pagingDTO);

	/**
	 * author yh.ki, (25.1.1)
	 * 미발령 직원 리스트 조회
	 */
	List<UserDTO> notTransferList(PagingDTO pagingDTO);

	/**
	 * author yh.ki, (25.1.2)
	 * 인사이동 부서 및 직급 리스트 조회
	 */
	List<UserDTO> userTransferInfo(String username);

	/**
	 * author yh.kim, (25.01.02)
	 * 직원 인사이동 
	 */
	int setEmployeeTransfer(List<UserDTO> userDto);

	/**
	 * author yh.kim, (25.01.02)
	 * 직원 정보 업데이트 (인사이동)
	 */
	int updateEmployeeUser(UserDTO user);
	
	
	
	/**
	 * author yh.kim, (25.01.02)
	 * 직영점 인사이동
	 */
	int setStoreTransfer(List<UserDTO> userDto);

	/**
	 * author yh.kim, (25.01.02)
	 * 직원 퇴사 처리 
	 */
	int usrQuitDelete(UserDTO user);

	/**
	 * author yh.kim, (25.01.02)
	 * 직영점 이동 시 직영점 name 조회
	 */
	List<DeptDTO> storeTransferInfo(String username);

	/**
	 * author yh.kim, (25.01.03)
	 * 직영점 이동 시 기존 직염점주 변경
	 */
	int setExistingStoreTransfer(List<UserDTO> userDto);

	/**
	 * author yh.kim, (25.01.03)
	 * 직영점 이동 시 직원 테이블 업데이트
	 */
	int updateStoreUser(UserDTO user);

	/**
	 * author yh.kim, (25.01.03)
	 * 직영점 이동 시 직영점 테이블 업데이트
	 */
	int updateStoreOwner(UserDTO user);

	/**
	 * author yh.kim (25. 01. 07)
	 * 부서(브랜드) 등록 시 발령 직원 부서, 사번 업데이트
	 */
	int userDeptUpdate(UserDTO userDTO);

	/**
	 * author yh.kim (25.01.07)
	 * 직영점 비활성화
	 */
	int storeInactiveUpdate(DeptDTO dto);

	/**
	 * author yh.kim (25.01.07)
	 * 직영점 직원 부서 변경 (비활성화 시)
	 */
	int storeUserUpdate(DeptDTO dto);

	/**
	 * author yh.kim, (25.01.11)
	 * 직원 등록 시 직영점 조회
	 */
    List<DeptDTO> storeIdList(String parent);

	/**
	 * author yh.kim, (25.01.11)
	 * 직원 등록 시 직영점 정보 업데이트
	 */
	int userStoreUpdate(UserDTO dto);

	/**
	 * author yh.kim, (25.01.11)
	 * 퇴사 직원 조회 및 처리
	 * 매일 00:03 실행
	 */
	int resignationProcessing();

	/**
	 * author yh.kim, (25.01.11)
	 * 직영점 비활성화 시 직원 업데이트
	 */
	int storeUserUserUpdate(DeptDTO dto);

	/**
	 * author yh.kim, (25.01.11)
	 * 직영점 비활성화 시 owner 업데이트
	 */
	int storeUseYnUpdate(DeptDTO dto);


	// 기존 로고 파일 업로드
	int defaultRogoUpload(DeptDTO dto);
}
